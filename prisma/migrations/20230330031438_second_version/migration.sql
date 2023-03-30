/*
  Warnings:

  - The values [FOUR_OPTIONS] on the enum `SurveyQuestions_type` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterTable
ALTER TABLE `SurveyQuestions` MODIFY `type` ENUM('BOOLEAN', 'ONE_CHOICE', 'MULTIPLE_CHOICE') NOT NULL;

-- CreateTable
CREATE TABLE `SurveyQuestionAnswerOptions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `answer` VARCHAR(191) NOT NULL,
    `surveyQuestionId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UserSurveyAnswers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `surveyId` INTEGER NOT NULL,
    `questionId` INTEGER NOT NULL,
    `answerId` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `SurveyQuestionAnswerOptions` ADD CONSTRAINT `SurveyQuestionAnswerOptions_surveyQuestionId_fkey` FOREIGN KEY (`surveyQuestionId`) REFERENCES `SurveyQuestions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserSurveyAnswers` ADD CONSTRAINT `UserSurveyAnswers_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserSurveyAnswers` ADD CONSTRAINT `UserSurveyAnswers_surveyId_fkey` FOREIGN KEY (`surveyId`) REFERENCES `Survey`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserSurveyAnswers` ADD CONSTRAINT `UserSurveyAnswers_questionId_fkey` FOREIGN KEY (`questionId`) REFERENCES `SurveyQuestions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserSurveyAnswers` ADD CONSTRAINT `UserSurveyAnswers_answerId_fkey` FOREIGN KEY (`answerId`) REFERENCES `SurveyQuestionAnswerOptions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
