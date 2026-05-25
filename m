Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968843E7157
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701356; cv=none; b=nu/U4L2Y0zuoz0kMrtP8ihSiMb8HgQsuXhKMKFIH+ZXBxixQLE2W7jfLzLA0hFYxKNynLwLwhndO+9WiPqlGilMFd+X6iHdltZblhU7rJNH+mDxMmafCQcQhKH47BFtXWO9ysCm0hBdoJAX7ha8V6PIzCG23b2m5Z0rvjbQthoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701356; c=relaxed/simple;
	bh=fe/hnE8GZQrLciu77A+fejlNUzSNd3LNX6x61CvRXJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uPLKWeWRwB8rl3TvbLAuhkAkZiFb+EIA9acNOS8o4fJASoNg4g/twlch/UGZcVKaI71UV2+mtYSCA4gz8+2ibE9BnWXF5cNRgTHyiquY7OAVYZrTU+mzmaU7F1zmjSp/YP9uyO/Wbg+pIOjGBrvY0xpvS/GLLvUOSx2VCMVkliA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPtEfQOQ; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPtEfQOQ"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8b1f2b7f1bcso145004326d6.1
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 02:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779701344; x=1780306144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Iq5ZhrKPSPdMYnMkmpf5M3ZZW+Mtt1BsX+A9zE8LaQ=;
        b=dPtEfQOQyndCd2aaxBQmWPzup4sjsvtS0ZhfkYkObzTz/S6YdAdphSN+wXB8gfn74M
         Trsf+Iw+lstOB7ncvOziZECbtdVT+16TDfzIDUC+LvNgTQ8C5HduGsvvaaoteLDXmq02
         BM7IgdSY2t9iTN3t/411+fdmbWHbVO9v6qy29bGgvj/UVljl+SpQEdO3PzqxFudCp98/
         msOLvLp5WcWFtDtEBkzkTV3KZk/ruNcNH0I/DrO+6Hqk0mpfcZsiHXGnr7ondV7c9quR
         hnc06KSLiL4T7Hey6l1q2U2Qu8B5sABmulfaxdHBoP9zmeQ2NC97yp7wW9cUm9zVRgin
         v2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701344; x=1780306144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Iq5ZhrKPSPdMYnMkmpf5M3ZZW+Mtt1BsX+A9zE8LaQ=;
        b=Wom1V9o3Fetk8DE3klg6yPkigyoikh1WD+OC/L9QBkYBi/iA3uT/8qWvc464JUPzIj
         9fTQYTS5Q3DUBNiB221ltCsTObNnRa+7DgG3GtduWEGc8pDo5ArtGycUBk0c1Ra+fBhs
         XDF3+78yArwPpGzs91rd3vKKDGpeHo1Sx/jYWgYrzoe6K0OmsnmjRVH9G8kMVpGNgAJf
         kpjYwlKRR50mRaWNzr7QJi3zJVE3Gf7qWzimNfOMcjWrOpjBGud6ub++UacHgTsStKKw
         UjwkgLFxzuvbtJfsBEISj4zG1GO2LUXntyfYPpm7rsh6Djgj/3ZmCFVG8lXL+cIOwpEG
         fsXg==
X-Gm-Message-State: AOJu0YyCrR+IipUZPvtuCmxYo0Z62poAqiriGSuATmIa6KaqnSE+bTJ2
	7ZLtss7TXEyxHx0uPoJiEp7hvkh+O0s080CFOzD97xcwEQLIee56gDg+rr7LimFv
X-Gm-Gg: Acq92OEQ3E5z6t6SJLeJMshdZV/Qem/me45i7hLNBfNgRLqeKSimaXWznfgFRtWP4dH
	y5wkitqQVV3oQRO7OrYjPgb7QpIyMN8weU367vfFp3BMc/ACVc5x2o+QabTwu5AwZLBtx/EJcg8
	YfDu1x9Vlt0Ksu6UihtkQiobEq6QwPDmFBS7vcWTOZxnlEH4CPTAx3B6TULgbS8VsJ5KBCE0OUO
	8MDb2ZvdVkGW2XkuXwYe523rDQJgIJ7akpmRj4edNuB3UI3t+pXwrZNMPcH88/MrZbq1akWqCh1
	4e33jc6mHtAvmWUEzQRYqXlgxcNTG6BE9EkSROym3OF1J/AKutr79gkatE+Tj4YscXg9eEJ+zy3
	c2D5c7uEI/mxQCRZZT62ryX9/6SbAjuDKQ2sAQlGmcsZxJrGq5SfNnGJ8EEHnTXFgejYjQseeDd
	hVN2kcdDXMBFH55ZbmXCXsCe1NXHBz9ZVdu1jTP3ZYm2kupT2HOWWWenoKEKwle7QElv192GUem
	uNuJvWWlfx7OiJ+EuRqmbU9j4tZdyYdU10b1MopIxU=
X-Received: by 2002:a05:6214:5882:b0:8a7:164c:d5c8 with SMTP id 6a1803df08f44-8cc7bf194acmr185185226d6.24.1779701344361;
        Mon, 25 May 2026 02:29:04 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80dcf4a9sm104255826d6.2.2026.05.25.02.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:29:03 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] thunderbolt: test: add KUnit tests for property parser bounds checks
Date: Mon, 25 May 2026 05:28:30 -0400
Message-ID: <20260525092830.735472-7-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260525092830.735472-1-michael.bommarito@gmail.com>
References: <20260525092830.735472-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add regression tests for the zero-length entry and root directory
bounds fixes:

- tb_test_property_parse_zero_length: TEXT entry with length 0
  must be rejected by the validator.

- tb_test_property_parse_rootdir_overflow: root directory whose
  content_offset + content_len exceeds block_len must be rejected.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/thunderbolt/test.c | 40 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index 1f4318249c226..345f39ecd233f 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -2852,6 +2852,44 @@ static void tb_test_property_copy(struct kunit *test)
 	tb_property_free_dir(src);
 }
 
+static void tb_test_property_parse_zero_length(struct kunit *test)
+{
+	u32 *block = kunit_kzalloc(test, 6 * sizeof(u32), GFP_KERNEL);
+	struct tb_property_dir *dir;
+
+	KUNIT_ASSERT_NOT_NULL(test, block);
+
+	block[0] = 0x55584401;	/* rootdir magic */
+	block[1] = 0x00000004;	/* root length: one entry */
+
+	block[2] = 0x61616161;	/* key_hi */
+	block[3] = 0x61616161;	/* key_lo */
+	block[4] = 0x74000000;	/* type=TEXT, reserved=0, length=0 */
+	block[5] = 0x00000000;	/* value */
+
+	dir = tb_property_parse_dir(block, 6);
+	KUNIT_EXPECT_NULL(test, dir);
+	tb_property_free_dir(dir);
+}
+
+static void tb_test_property_parse_rootdir_overflow(struct kunit *test)
+{
+	u32 *block = kunit_kzalloc(test, 4 * sizeof(u32), GFP_KERNEL);
+	struct tb_property_dir *dir;
+
+	KUNIT_ASSERT_NOT_NULL(test, block);
+
+	block[0] = 0x55584401;	/* rootdir magic */
+	block[1] = 0x00000004;	/* root length claims 4 dwords of content */
+	block[2] = 0x61616161;
+	block[3] = 0x61616161;
+
+	/* content_offset(2) + content_len(4) = 6 > block_len(4) */
+	dir = tb_property_parse_dir(block, 4);
+	KUNIT_EXPECT_NULL(test, dir);
+	tb_property_free_dir(dir);
+}
+
 static struct kunit_case tb_test_cases[] = {
 	KUNIT_CASE(tb_test_path_basic),
 	KUNIT_CASE(tb_test_path_not_connected_walk),
@@ -2892,6 +2930,8 @@ static struct kunit_case tb_test_cases[] = {
 	KUNIT_CASE(tb_test_property_parse),
 	KUNIT_CASE(tb_test_property_format),
 	KUNIT_CASE(tb_test_property_copy),
+	KUNIT_CASE(tb_test_property_parse_zero_length),
+	KUNIT_CASE(tb_test_property_parse_rootdir_overflow),
 	{ }
 };
 
-- 
2.53.0

