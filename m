Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D8D2C0F93
	for <linux-usb@vger.kernel.org>; Sat,  8 Aug 2026 22:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786228725; cv=none; b=vEB70wO4cLBaw1nfb/qNv8GhCT5pgywPX8zvhqk8UWEgf2MrHBU8kEoou7mqHgMzoklB6GwgJ/QHRjwMmWhwJOWKgcYOGm8REi1R65fasB+6nSa3nPKRlLw7GwyGJZZYV+MW9Vm4iRb+B2vpvTd6AZG0a0ZeAyptM707Pi9vLJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786228725; c=relaxed/simple;
	bh=Ty8/212gzQTG3G6pDITHzBJEjhfzKNyfdm6SuXbbnfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iLoG1DeluR8SGqLmcoXb50OY+qO4HZqMzhhKiR+DBmrAtvDubiK+s/J39lBGeOyuHy0gDu6MVa4dOFdYhLfz5YpT7RTHddwSci0B1I5VlfL65tOnnobG5riYXJPxKiIRR9mz6b2gk7Wd/mYVylhGFdOCH87QrFsmbETSI4ItoUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rofIp5gw; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rofIp5gw"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38759bcd877so675656a91.2
        for <linux-usb@vger.kernel.org>; Sat, 08 Aug 2026 15:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786228723; x=1786833523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJ8z2w5TAYyMQBi41G57TpAIPMqEvv+mH4U+15dWEAA=;
        b=rofIp5gwXwmWSmRvXIlHYLsJqVhyorWwqRJehgn0ka6jBuWQEOGyaNrDLY5KmSUfa3
         w5+DTMmUuZ4Sy6inCLmp+ChA1Hxx6WsdN0PcEX9Axta3u5y3lcgUqqmBlJR9nWEh4X8E
         clejt356GholSXoph5bBxPp6Q+S4rasXluYSxVStMXGnybDNRvEV+JhgSQafNLGvuUoz
         sx0V0Rc7m7eW5KWxP8Ycgy7i5rBBbhepaVT8x9gb3eCCveuFuMsxwAshLN2ySAIjPNMW
         TGE9rdSnzlNNGDzqtrtOjzd4/npyjwAjy7xhL90Ah9SWIAvB5ghjfx6NZrG7DVohxK24
         3CxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786228723; x=1786833523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJ8z2w5TAYyMQBi41G57TpAIPMqEvv+mH4U+15dWEAA=;
        b=R1fcnJgdfaiUL4XlkfLTdbv/EHf93INry2bgSrd3NgyrGb+PSmshWx24d9U4iBOXXl
         la47JpBdqfWzHIM/biav4g4aYJRCmJHHrXsfQ6CiNixAGYjTR0BGz6coDIrpYGvOfpM6
         /9/F3VjgdGUVqJ5G+6RkaV6NqHUUMFdWLdRlegqycZMgTvbofnAF/yRvkv84FaAxG4e7
         RpoxLq028iCiNOlT7bFrlzlReDO4FH8GdsqXt/AunfvN6PscOB7NbU+bquDap4AOocRS
         1D8UJKuV8GYTMyDLIVo7Tv0uNMOY9HCb9mHxKizBg69kyVv5tmPIA0xFdM41fCjApRe8
         mcyA==
X-Forwarded-Encrypted: i=1; AHgh+RrYQSC6XiO8JZ00Ia5ss7QaZAI5oBjurYEELPRCU1yp9mDIu/oW9XKhIcJsXhNuEpDI8XNQKcIxV2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEYAqoMu5KEKvSoO6yKIFuus8TlxTQACfqMrL7U/rR4Mf3wOnh
	bMPRSxJ07BQRmwAAa5zwowSuYXesgIWVhv+bRA0oywVl5vvu5WwuYwf0
X-Gm-Gg: AR+sD10bAd8UTqC8sIP9YwbdxJDnuZB2fRxRgvk6qsLZQx1Lq3jR9o1TsIanPRcW/kB
	e9naIAzGdAoeZNHiJKs0jSxgbkGCgxCX9HqZdw8JMR1Vq44UajE7KDE2n2otsI7/l5BufRvc7OP
	MyE/KfDclEFNkdfV3X9QtO/4+Oj2IqRoED273FSMDFvRJ59PHEbyCK+/ZouTZ6Qv75fug4yDZWM
	zOPDC3jkHvErfntSJjQ0X7ruWdhJTgmtkqDCqenigudVjVr7VdG2GgzCeAiLzXyfpEm2DunTPeW
	olR10uaEp9EehRjQVIkoIzQszk7iYCZSowe7Bbs5IlGvnq2DtJoCO0fRUd8mrF8LKnMQIVXSgJY
	QeiS7I+gUdVa42QFWsaXBX00ENMEar1Q2lSfCXMUTMzYd7WFtqu4lrbUxz+sCQZ4Mosn9fnfNa7
	/L9qKtGXX4gfgyL2Pqi3z+2Q3MowqlNBR+1JVQULkjK6V56wsoTeqRBYEJkFXLl87CLjA/QIX7i
	97j27/8b5g=
X-Received: by 2002:a17:90b:3a81:b0:37f:f8c5:93c2 with SMTP id 98e67ed59e1d1-3903c634c04mr26464160a91.21.1786228723140;
        Sat, 08 Aug 2026 15:38:43 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8d6074sm25448103eec.12.2026.08.08.15.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 15:38:42 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH] thunderbolt: debugfs: Replace get_zeroed_page() with kzalloc()
Date: Sat,  8 Aug 2026 22:38:29 +0000
Message-ID: <20260808223829.3117-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

validate_and_copy_from_user() allocates a page to store data from
userspace via get_zeroed_page(), and then returns it as a buffer.
Neither the function itself nor its callers require struct page access.

This buffer can easily be allocated with kzalloc() as there is nothing
special about it that requires going through the page allocator.
kzalloc(), which internally reduces to kmalloc() with __GFP_ZERO,
provides a better API and kfree() does not need to know the size of the
freed object. Additionally it removes the casts of (void *) and
(unsigned long) which only obfuscate the code.

Replace get_zeroed_page() with kzalloc() and free_page() with kfree().

Compile-tested only; no USB4 hardware available.

Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com/
Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 drivers/thunderbolt/debugfs.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index f5cf0e177f40..6e9080e7bcec 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -136,13 +136,13 @@ static void *validate_and_copy_from_user(const void __user *user_buf,
 	if (!access_ok(user_buf, *count))
 		return ERR_PTR(-EFAULT);
 
-	buf = (void *)get_zeroed_page(GFP_KERNEL);
+	buf = kzalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!buf)
 		return ERR_PTR(-ENOMEM);
 
 	nbytes = min_t(size_t, *count, PAGE_SIZE);
 	if (copy_from_user(buf, user_buf, nbytes)) {
-		free_page((unsigned long)buf);
+		kfree(buf);
 		return ERR_PTR(-EFAULT);
 	}
 
@@ -265,7 +265,7 @@ static ssize_t regs_write(struct tb_switch *sw, struct tb_port *port,
 out:
 	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
-	free_page((unsigned long)buf);
+	kfree(buf);
 
 	return ret < 0 ? ret : count;
 }
@@ -406,7 +406,7 @@ static ssize_t port_sb_regs_write(struct file *file, const char __user *user_buf
 out:
 	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
-	free_page((unsigned long)buf);
+	kfree(buf);
 
 	return ret < 0 ? ret : count;
 }
@@ -439,7 +439,7 @@ static ssize_t retimer_sb_regs_write(struct file *file,
 out:
 	pm_runtime_mark_last_busy(&rt->dev);
 	pm_runtime_put_autosuspend(&rt->dev);
-	free_page((unsigned long)buf);
+	kfree(buf);
 
 	return ret < 0 ? ret : count;
 }
@@ -652,7 +652,7 @@ margining_ber_level_write(struct file *file, const char __user *user_buf,
 	margining->ber_level = val;
 
 out_free:
-	free_page((unsigned long)buf);
+	kfree(buf);
 out_unlock:
 	mutex_unlock(&tb->lock);
 
@@ -829,7 +829,7 @@ margining_lanes_write(struct file *file, const char __user *user_buf,
 		}
 	}
 
-	free_page((unsigned long)buf);
+	kfree(buf);
 
 	if (lane == -1)
 		return -EINVAL;
@@ -958,7 +958,7 @@ margining_error_counter_write(struct file *file, const char __user *user_buf,
 	else
 		goto err_free;
 
-	free_page((unsigned long)buf);
+	kfree(buf);
 
 	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &tb->lock) {
 		if (!margining->software)
@@ -970,7 +970,7 @@ margining_error_counter_write(struct file *file, const char __user *user_buf,
 	return count;
 
 err_free:
-	free_page((unsigned long)buf);
+	kfree(buf);
 	return -EINVAL;
 }
 
@@ -1116,7 +1116,7 @@ static ssize_t margining_mode_write(struct file *file,
 	mutex_unlock(&tb->lock);
 
 out_free:
-	free_page((unsigned long)buf);
+	kfree(buf);
 	return ret ? ret : count;
 }
 
@@ -1503,7 +1503,7 @@ static ssize_t margining_test_write(struct file *file,
 	mutex_unlock(&tb->lock);
 
 out_free:
-	free_page((unsigned long)buf);
+	kfree(buf);
 	return ret ? ret : count;
 }
 
@@ -1569,7 +1569,7 @@ static ssize_t margining_margin_write(struct file *file,
 	mutex_unlock(&tb->lock);
 
 out_free:
-	free_page((unsigned long)buf);
+	kfree(buf);
 	return ret ? ret : count;
 }
 
@@ -1624,7 +1624,7 @@ static ssize_t margining_eye_write(struct file *file,
 			ret = -EINVAL;
 	}
 
-	free_page((unsigned long)buf);
+	kfree(buf);
 	return ret ? ret : count;
 }
 
@@ -1934,7 +1934,7 @@ static ssize_t counters_write(struct file *file, const char __user *user_buf,
 out:
 	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
-	free_page((unsigned long)buf);
+	kfree(buf);
 
 	return ret < 0 ? ret : count;
 }
-- 
2.54.0

