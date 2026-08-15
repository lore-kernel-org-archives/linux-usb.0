Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691E52931F2
	for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 01:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786757939; cv=none; b=UxlQCm0/vXxwmyK6dTb3CRz/J3bwWQeBkcxv8XpTA+hZI1rIHGlWanMVUpxFfEGmjRX/6mqoZHzo2l5P8HTXuAFqnhzlokv2LolXZ0No/uEgzYpCAPXLBRthiNIHL/kdvCm4cLfZTa65bKuRAB2SbcLhFN+N489nQV7hDtKgm1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786757939; c=relaxed/simple;
	bh=mCOXa+UzANBq0YSTWd7h4Gptj1cmZ7Q9m3HFpmaUeyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e9Wnln90Sux63CYMcQ3DZQu4GbPl4rueb6+JPcAWFej08CudGv12iP5kMnTiUC4xIv9Fi395pvDIj//5/WTJ/6M07FEQyoFb6dR4q1axAY9D2D6npUrf7fozvzd0JGco8OKwZ7SVrvwuJb3PrHgtr058vS/PDtMVq7j9sUG2jAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cChEtWE1; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cChEtWE1"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-90898faf46dso7480296d6.1
        for <linux-usb@vger.kernel.org>; Fri, 14 Aug 2026 18:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786757937; x=1787362737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0DPz+4csxg4ejb60H4w2G/Kt+5hvp2XVZ2P+UQVR9Dk=;
        b=cChEtWE1wDypLFTDVZvmbKsaRHG6fe1c6ef+TSesD6EFe1y57VCUfeIqFuQvCLbXjO
         NUYp+1DXg9haXqwcdBYugSuPmpVe6QkG4Tagm3KHNkpwpiD/ueMNd/U0AWTtfuuGnlJd
         yzzgCqoz4jUzOfGDhfyoDyIrl7dAHg0RLc7oEzmU5oOppXz329fRquZIbB35kVlMNtGM
         Bw0Ee3q+td35oSwAjrUtQul4/gi1ifG/hoimC9fsx8BUAsWDynqp6qCy/rKu5THbJYTG
         Km8ck/RLIp9UeLXxDudrIuMcASdHilHz3wLqOdgiYRlOKufpuASenbfRN5LNJRC04XsW
         P6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786757937; x=1787362737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0DPz+4csxg4ejb60H4w2G/Kt+5hvp2XVZ2P+UQVR9Dk=;
        b=DlrK+hV+lu/YfpF4jgjIxHbdihC44I8hHJyQ4iZF8o9tFhUmD8WTqYWb9tPITdmjdz
         +gXZL8zm+X0ppe+VXFmkeJL8IIoRNlGdAUOkf+1vZTUuaJUDnEgFlGn9mG3bqXys2ZyG
         n8xx8sprm7FUObzaj+GKNET+IXcCQqCuuPck2ESBmSNPiUQ7Z9Q3Zy8uFFJRZ6jlGr6V
         5hNURWM74pCx8U0gtSVbIOTuCLnJmTH80mSbFn9+03gclPwqGnBfG68hmfajrj/Zrp/S
         Ztgeq40qRD6QPXih5igm5Wo21Z1ViUROc0jWxgyrIZtefTC96GRnpB89YZL2Fx0JabrJ
         3LEQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWFqhzYfOFDDDZ5ftRGE4W4z88jgc95XGgC1ZdDrrUg//kV3KasviYWkuE/fsj2GTzOvNFFKrlRcs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOYD1KwOaxMv97ZsfZ7tkfXwNuSb8FdkQFB9QljNAqj5bfRzd3
	fr4VcxrUG+NkhsGEsYezoNhnHkAYupFc0vOsqzpLhJWY9wcNeDeBV5XZ
X-Gm-Gg: AR+sD10poWPe9pTv8YxFUze/40hGOxuJHGjEw+Nmp1ghF1pbIFNkbL3r+B65zIUvUA+
	3VwCnR4FWXYtGnFjTWm+u0rwNF7hDuoxCoaVUXQ4a6Zpz/3v2uVoB89yFripOX5BLe05zkxRoA2
	Ui0aWTswvEwvYDf5W/KpnjmZjAyHHrAxR2GVermIdVWoETyFCcELc1MfZrRol9xE4fqCSshECE0
	y9Q2vUopP84uueUEGS0b+VN77ij+pBgM7IPaMyPs1tRnInvuVYkSLLT/tU3H6nRYuBBEKSyygu0
	KL9Rs6RT8iXQnTqLhAxVfobpzfjElyq5fXIUL+tUyJ4jycEvhNrmrYJcDnJkKKT81RqsC9flNl5
	Ynocterp30vCaAwqnma1W6kx4uXNjJdjcLJpITiaBD5aAWaW0vpDb7jPRJj2v2s9LNebnzz5Dg5
	zO+4eyVasjIo2kWuUS3cYHnQ6ZnMRyze8YFTN2QCOyZEjNSw6NK5eRCAF7aEUS7O8OJqHhG67c0
	BalBZ3a3Lvh/omr0B4=
X-Received: by 2002:a05:6214:1316:b0:8f2:3472:5b33 with SMTP id 6a1803df08f44-90a91da5cd9mr114078476d6.23.1786757937258;
        Fri, 14 Aug 2026 18:38:57 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a9354d2c3sm30800376d6.38.2026.08.14.18.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 18:38:56 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: gregkh@linuxfoundation.org
Cc: viro@zeniv.linux.org.uk,
	r.baldyga@samsung.com,
	balbi@ti.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: f_fs: fix use-after-free in ffs_func_unbind
Date: Fri, 14 Aug 2026 21:38:18 -0400
Message-ID: <20260815013818.39466-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ffs_func_unbind() continues to access ffs after calling
functionfs_unbind(), including taking ffs->eps_lock for endpoint cleanup.
However, functionfs_unbind() drops the binding reference to ffs.

A concurrent FunctionFS unmount can drop the independent superblock
reference. Either put can then release the final reference and free ffs
before ffs_func_unbind() finishes its endpoint cleanup.

Take a temporary ffs reference for the duration of ffs_func_unbind() and
drop it only after all post-unbind cleanup is complete.

Fixes: a3058a5d82e2 ("usb: gadget: f_fs: remove redundant ffs_data_get()")
Cc: stable@vger.kernel.org
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
 drivers/usb/gadget/function/f_fs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 44218be1e676..8acad4564b6c 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -4089,6 +4089,9 @@ static void ffs_func_unbind(struct usb_configuration *c,
 	unsigned count = ffs->eps_count;
 	unsigned long flags;
 
+	/* Keep ffs alive until all post-unbind cleanup is complete. */
+	ffs_data_get(ffs);
+
 	if (ffs->func == func) {
 		ffs_func_eps_disable(func);
 		ffs->func = NULL;
@@ -4122,6 +4125,7 @@ static void ffs_func_unbind(struct usb_configuration *c,
 	func->function.ssp_descriptors = NULL;
 	func->interfaces_nums = NULL;
 
+	ffs_data_put(ffs);
 }
 
 static struct usb_function *ffs_alloc(struct usb_function_instance *fi)
-- 
2.43.0

