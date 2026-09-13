Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D2640B0E2
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 22:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789339075; cv=none; b=UE8dz8kUtJGgYwrS0tB0PBobAecIqj3SpKaHiKkkmiG3ZpbxBbmkbwFkwhax891fodtu2fs1tSoRDF5oxRbMtJw+YDQwdwJx0pRKbxSK5LXqirps8Z6YWCxxFv+KPHig9YVGMba48bgySdIT3ouTtVnQ+YTNiIqTDBd4w+os8wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789339075; c=relaxed/simple;
	bh=77rMhJ96Hr7kt35p05mN/FY3qSVNLhdnYmkNXT/rfv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HVwup84i+z+UzJgVWsi3dKIQXP5efbbtIXVFMcikBIILzE66V+rACtpQYGco+R7gnwosgWGpjPI2hNo/ThqkesS3FvUD2xHVVygWSY50cbJjU8EyREAH+P1AFsxcQCh6U4zcZB2Lkg0KsPR2r5/OHJc0FhpCP2ENHbbXz6oOJHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7ObzS3B; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7ObzS3B"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93a125dd74bso80687985a.3
        for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 15:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789339072; x=1789943872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eC2whU9fXcoJ6LICLe5n5h5thnnSk+FT//fcnt2+uc=;
        b=K7ObzS3BsTgssppi06tUopRu3nLYwoAyj0LjrjmjTyYZCD0K1sYB1wf5UicISAfcwt
         2WC8Tb9n5Ho+kBA2ulPRAZ6Cz3P9sLwGKPO68kagYeJAHvrsWDtffdZK55UAxtHOal+A
         OiZyAJrWjx0KLwW8e4m64LOXcm+dF0uDUNv/041EoeUtDsqPe/thrsx2aBexG36jtj95
         uZxswIl7rvc6vzn0FQ0WL4O9sMwINQIUr7fbGfZvaX7HPGJWso7KdQAISYR74hZkYG5B
         OeH1y+1JNqmDx4Uf4vDc9lzB1OUM/MMZvs6hN4zO0tCq9l7pbui41t8yIIgz1lRamJqm
         1KYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339072; x=1789943872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/eC2whU9fXcoJ6LICLe5n5h5thnnSk+FT//fcnt2+uc=;
        b=Ntho4qQXpl+pgQn3SjqYbXJH9mQHxSULXEk5FuklEYCDvW0nLfdEFyPqRU/G5zx6GS
         BeR9SjqgGN+pqcDUINieOmcWt1sLaJ+F87raMYOvjxbxqw+2vUvjQQH/JrJwLHcMVDm1
         gs27tkFiOOUdlIkgUiYYanJ0naB+px9GE+Ez+Ed2iR5S7D5bY6ljN4rfnn32oNIaW4J9
         0J/X+s8zcV5xmZ2kWC0DjptqPt3c1TEAZzgJEDFuZYg8IXkbSS5yLZzx2oK61dPgi8K0
         GIeJj2Z2c/l5X28xKa3+fNlzhfOMLabnIw/zXJ5brmkzon/4aPcd1ReBn6m/nwYzvg+1
         Ph9w==
X-Forwarded-Encrypted: i=1; AKwUvBwAes71lpbkrc9aowvJVtti3Pn8SUvA10kfcawNzciv+iG2dj2E06z++g3vw3TQKl6w2gC2OKShLqA=@vger.kernel.org
X-Gm-Message-State: AFuF++mryqKRVN3cJPVt4yqrWIxzFq1hvg1iMtZXIJLcusT2vxF0cTT5
	F/2LeC/8xwINP2JSVRReqL5SG1rfz04kVzsjv9BYiENPRnTHKvdScP8=
X-Gm-Gg: AYBFou0D24Zw62nM8wZG9o0e+yTGpsuVVDaSvekMsEk/dpFkf1GaQrycr/igG5cjwdn
	PZ+hBTHl+6mqRZfs2iEhJPjBx6ocHacFsTGoilqGCClchfo5V/BkmuxpIjOcr0Z2UDQkL2Agdsw
	NL7WmppknJkqRFxt9fyuoecufMZAJKnnGt9WCzM8aJScTJFn0Jflku2mruBYyWxBjZ49r6nsJbD
	JTkY4PFc33D0uQaUaLs57Uy3WfNR/uuhnKdTGs/GY50dXZLuhmgYA1ohe5IHaBACXAFN5zmvohD
	k96Y/tcdz1FvesyWmmAJvkX08Lx191tjq2HTs54oBRg20XH8IDh1WNkDqGrglRo2Ii2auZ9rSR5
	8+yi5n+L26MTi9wgxvNbKXneNvlnHwyz0OeonruCGy07jfe8pJledMr1TvvHrCOqNu5sQvoNRrR
	IZlKyCO0YSilkmpULf9lWIq3aSH2IXtXWyxcroU6b50aT9mFSfGB66bicMwzI6HQ2Sc65tSKF6U
	VGL45fzlUXXEvgIEpDGjgigtekXQ42vCL9rBOlXqPCMI54FoqaWOFQMXuKTuFn3ab92gliD+Gei
	xbO3EJ17olnYWI5tiOLG9hPjCqb17IRKaA==
X-Received: by 2002:a05:620a:8081:b0:932:ddff:123d with SMTP id af79cd13be357-93a29945ca8mr25452485a.29.1789339072480;
        Sun, 13 Sep 2026 15:37:52 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45cbf2sm79361056d6.17.2026.09.13.15.37.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 15:37:51 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] usb: ohci-platform: Disable controller wakeup on removal
Date: Sun, 13 Sep 2026 18:37:31 -0400
Message-ID: <20260913223732.92882-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913223732.92882-1-mhun512@gmail.com>
References: <20260913223732.92882-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When OHCI reports remote-wakeup capability, a successful wakeup enable
leaves a source attached after driver unbind: usb_remove_hcd() does not
disable controller wakeup.

Disable it after usb_remove_hcd() to balance the enable.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: fa3364b5a2d7 ("USB: OHCI: Add a generic platform device driver")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ohci-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index c801527..c2a90a4 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -246,6 +246,7 @@ static void ohci_platform_remove(struct platform_device *dev)
 
 	pm_runtime_get_sync(&dev->dev);
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(&dev->dev);
 
 	if (pdata->power_off)
 		pdata->power_off(dev);
