Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695A73C8728
	for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 09:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822599; cv=none; b=kFvORLV1bDaiCwkROKsJF0KqPtVE04ImaSfS8IBcGQF5SbQ+5JnOJ6EkJ6pldd6TdhuI/B/CjVK/wTt40/xk+whBCoFxOIpnxxNwvdXsy8xAbh8MFfU8YEoEYK1S0kclJgo9MpqU0q8meWEvpsUmZNyd5y4BTi2LVy1pazfD0zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822599; c=relaxed/simple;
	bh=pilzqgLX23vrgU8x1OrQeeuvR+C3KBcsvDYv0GU7JNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ph38n2BeiUmjeJilQoii2DrWobdzW7qqLvHhjw1mTGlV8DqHT5NYc8WpQZ0IVlL2PV6EpxpZ06JpNNHlMSy6tjIMsbIvVtDAh7g0gs/xqo71wRoE/+bpXT7Z5N8zL+AkE5YmZxY1C/at+GC4emVBKmuKP+2z49toGbuqYFRjzOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+VeMma7; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+VeMma7"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1785668a91.0
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 02:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787822596; x=1788427396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaA1NG09mAC26Uk+RbGvv99dkflUecBsEoDtXvZSg1g=;
        b=d+VeMma7DOFPbV6c8HI/j0lD2Gqq6H1sYrechKiHBrPkRzMQ+HWEP7v43q39LCnFcV
         4wRcbQIOCX+/f3C/ptkpSKCXcb4GJoYEJIqVi+Yx1YM6FtyoTv+BFYtonlk0PVXCGPSV
         aPWm8zZn42fKiYV8QNv+d7yOdCD6Pj4Z1jOwfwyi7y9ddr6fruJGVvg0xBW/o1iWXHL/
         ISvavpbGdK2QiHtJBTV5eklEmsGa78nQEY1uaMBkCYoMgjpVgo1WTzku8Nbn1AkJZqzR
         7WHL2CqaOE3bIQ4tK6VBJrYfk9DK5sJu0b+Rp37hcHCkrYwNr7pfjT79hv6qTNsPkbZp
         +j1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787822596; x=1788427396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uaA1NG09mAC26Uk+RbGvv99dkflUecBsEoDtXvZSg1g=;
        b=XY/8VCxUI16Z9Vk8ZWMwKW9rdq0d2aFeWwLWiVHwSFhov/KBBTy2QWEbcrOxQE+04p
         LfG/JFq56MY8J81q6tTBzOZIRWSMENoPSITL8MSiGkvokBtzJcbUZxjiFDCeVtVLR7x8
         ICZIPxQ2Ie4lSpIoYHWQoTiY/Urm8r/afSxFOU0AKV8Y6DIjtc3dM5/kt6tfjczTXGzS
         VFqUzb6c0ZVjkaC7wC89K32PvsToeqz12F8wyamLl6in9cA153PQc9kfG6SMKOdYcL5b
         qdhZb/Htzp4WTFBF3ofICqsSzU8rfjWN5z6p1IQ6i3zkwkm9jbklCGSyve19xPe/jkSD
         CDSw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6CGuQyA6MX0yx9kSp4MfnEQKg4v98T1gasXY33t8sDoEpKRs1xojWzhJX6Blh4P+3/rJoorZUIm4=@vger.kernel.org
X-Gm-Message-State: AFuF++lVmzr59jVYnj0jPK3CohK8YaFiJcIq+ck9GA4tGbxIhJbYww9c
	ibjqkwVrQa5yaCiV7k6rTrzBlu4V1lLx2fHCCsSc9SGmcnYlKL1jvt3W/hAIeA==
X-Gm-Gg: AR+sD13/hPXG7BRTbMRsKbhAL2frqAlsQ3i1onJ0m1unl6iFo3a0n5mgNCiVpWeRPmV
	VLO3jGJyynWRAciihpuPU6oqxo8nMRpqVPL4Kmy9VzOVs2bXBRzJzy1yRosY8WK3uNwJRl7hYwO
	iEmhxh49pkDItdFnQ1ALF4yjGVFg7rxkLptJ6xmd7K3KMsWMwODo27vaku8n5wJuUpEUs1Q1F54
	UM6Y0QRtdopLMtXL8zqG9fu0Osa1r/iryGzdpYdiJnJsci7gyz1Km4PJQ/QDHvFtJ/BrB5Np237
	ChOCN8Ecnj5ePI6JTABZOwmPVOwOZ6pRjFUrMjp38mlSGB1Cxtw/NN3KQIw2Tl3TFEgzR97FgmV
	ePp8SPgrKMegr6sNYu03uRA7Zs/shWRkNeifbSiLYOBQ6NRrJsg2+FefOM6Qq9jVT7YlvVbRqA3
	HKQTbZ4uClPmByaskwRvRAlRGTxdKLiL7+2iedMGANXbyGZw2IThH51JlHT8JH/n+Ixg==
X-Received: by 2002:a17:90b:164b:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-3966cdf6813mr25481388a91.0.1787822595919;
        Thu, 27 Aug 2026 02:23:15 -0700 (PDT)
Received: from Default ([2409:40f4:1015:7531:12c9:ad3b:96d3:4379])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905c18bsm16037789c88.14.2026.08.27.02.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:23:15 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: KASAN: slab-use-after-free Read in roccat_open
Date: Thu, 27 Aug 2026 14:53:01 +0530
Message-ID: <20260827092301.19883-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6a8fd9c8.50659fcc.60cd.000e.GAE@google.com>
References: <6a8fd9c8.50659fcc.60cd.000e.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: upstream 903c1cf6dff9

diff --git a/drivers/hid/hid-roccat.c b/drivers/hid/hid-roccat.c
index 4f15eb951039..505844890ed3 100644
--- a/drivers/hid/hid-roccat.c
+++ b/drivers/hid/hid-roccat.c
@@ -236,6 +236,7 @@ static int roccat_release(struct inode *inode, struct file *file)
                        hid_hw_close(device->hid);
                } else {
                        roccat_free_device(device);
+                       devices[minor] = NULL;
                }
        }
diff --git a/drivers/hid/hid-roccat.c b/drivers/hid/hid-roccat.c
index 505844890ed3..220666bdd13d 100644
--- a/drivers/hid/hid-roccat.c
+++ b/drivers/hid/hid-roccat.c
@@ -370,8 +370,11 @@ void roccat_disconnect(int minor)
 
        mutex_lock(&devices_lock);
        device = devices[minor];
+       if (!device) {
+               mutex_unlock(&devices_lock);
+               return;
+       }
        mutex_unlock(&devices_lock);
-
        device->exist = 0; /* TODO exist maybe not needed */
 
        device_destroy(device->dev->class, MKDEV(roccat_major, minor));
