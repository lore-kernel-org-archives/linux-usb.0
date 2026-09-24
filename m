Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DEA3B8BB9
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 12:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253775; cv=none; b=npHYhCLzzFoxefcWCc4Yj4oBi9gxBVvTT5UCjgZIGyXP1aVslyfK+pmhuMN3eBZ1AI1oLNzsQHcdbqnHS0EEPcupiuF/TvXwSyF8KGbXeiewNJHaIo1vI67kcjqQHYG8tTjtKPfVjexi/rH/d6CaT9LIcmcCHjPgkL661IqFggg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253775; c=relaxed/simple;
	bh=nP84PB3kRCTCnlOz1Nc7H4NTVYOtR4vU9qO9eligIho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oX9A/fQXkFhc3YpRqHbbAFN278BENzC4CSOXHLEgZGVLCCYTaeS9ZZnWlzKwMBjSfzd5bvB3eJ8BQsH4nmskxDvjlTOFrp/GhdjyJcV8Q+kaVkD1/smXO6PHT6CIJXf1vufMo2ztDCK7MEbJKLafPcmZLGbuWJSNwqzAYwYIZBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2fAmdHG; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2fAmdHG"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-142dd04edb5so3513279c88.2
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 05:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790253772; x=1790858572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yLhM0k1QZB/+EkXXYqDnetrlY3awQVlONe5SUYK8ebc=;
        b=Y2fAmdHG7VLB0KzExPYE3FTjlWN7ejNqufQhqht2s5WV8r8mU1pU18GLWxFR5J6w42
         EBO+tTQJtu2AuHYztSgFKUgZkDoXX7MshgPneYxfUR2zOxXlJrHBch5BafhHGsb1+H3D
         VdpKEgaD85+lQnxP3qlR/NQJsSQbA4TvHVECkWVihGH1FiFpTsZZxrI9a2ByphnFPquL
         Hkv3kvZ2kUFzoUB7XAut6FPDVMK+W9fX5jhnbOHPzXFndYmURHdeI0wERv3rM8B2zxEU
         GX4fTAIjjF13Tlcm5y/g4ZcYgm9LXvw1z7bRaRMeKgDon2NikNdbwgghGw3alETZU4F0
         bMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253772; x=1790858572;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLhM0k1QZB/+EkXXYqDnetrlY3awQVlONe5SUYK8ebc=;
        b=fgBGeWlpMiVTfbFGaFenkS56RL7++z5pMrHSwCTlvorI1bM6AvN51rjqbR+zwhhz1m
         6SR48HBH0CihqdQgbRHr5ynZTsPteYVboPfiWX4iIKS2g9NxqZpdRbXemEMezt3A6XPz
         AK23rq5qDU/6K6+0w4INeFGCYKm9RQZxU8IrC/dNg8V0AHpQthseFDde4lg3kdtpUYbU
         bMjyiK1WU/UBnlhcduJO49pFS63agOqUNuHC7+54GUnqDGySvRtqD0CKrx6qBdr7NuGA
         vZfH7T3BpI3Mqu2g4BU67HW3mL+BbwhLqqfmaUKTgIX65AiE3gWLlo069oKCM9Yes6pj
         UxNQ==
X-Forwarded-Encrypted: i=1; AKwUvByyPSr4/VPfbuZ+e6xBoQ4X+A3aa+TOivAWP5//HrvphEtwvfPHkiY/FDVdllKXmk4K7YnmfMjz/Rs=@vger.kernel.org
X-Gm-Message-State: AFuF++luoK3m4WfA5xYnLRV2P2xmH+lySSGmmSidXsnY+ICa3H3MZKvs
	+yUoGZ987s/jHAihlC8ma6jQyJT2KIwGJdCtMnSIPtODuT06I9N7/9Ag
X-Gm-Gg: AYBFou1ldErvb6kh7LV1psLtIyBqaAkiC5RSQZ1EGQOlyzfjr3B50M5OrUkbaE9ABoS
	2vghGAwzqMJEEFAuTkn3UDkanyf1ftL/FotQxVMjp8/35OY7rWTR2lP+0qzRbkHGKC6CqdAyrYe
	dQuPbULO2QroH2Kx69dAAg6bv1z9U6WHhZI4ZS2VgxeS84WBysCcUXeP0hMVbfGdIN6U8WIaCkg
	5QmdCIuSz0vwzbjhQHdb4IgxkL5OPyN8tnzS69EQt3JyKmBYJiRKVs53m1JpRyLUh6sv1GMhdNP
	lQJqQpDwrkCpYQ99zizgTVgXKDhHaNQ5+I7h1IlgPQZLyDGTihVuKEr1k7XzNXoT9IhsG6fBo9P
	M3uUbofEZb5sqLSoDyp7vJ2OmHc71VawKW/e29DVs6g7/naSxAib+aUezlod51I5K0h0neL2V3p
	x06kfewTGuQVQm+aYzXdH3tZlOI+sr1k+QrcKR5ZHPujiSYf9SmZeSh7g1sNnEtMR/8RO47ZGcn
	Qxo8fDz
X-Received: by 2002:a05:7022:b055:10b0:144:f47d:c2d9 with SMTP id a92af1059eb24-1450402286dmr1943677c88.38.1790253771515;
        Thu, 24 Sep 2026 05:42:51 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:43a9:9b8b:ebdc:6411])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f986e465sm13466113c88.9.2026.09.24.05.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:42:51 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: bhelgaas@google.com,
	linux-pci@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] usb: hcd-pci: Honour pci_save_state() failure
Date: Thu, 24 Sep 2026 09:42:18 -0300
Message-ID: <20260924124221.12374-2-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924124221.12374-1-fbeltranmillalen@gmail.com>
References: <20260924124221.12374-1-fbeltranmillalen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hcd_pci_suspend_noirq() calls pci_save_state() and ignores its return
value, then goes on to call pci_prepare_to_sleep().  pci_save_state()
can fail -- it already propagates failures from pci_save_pcie_state()
and friends -- and when it does there is no saved state to restore
later, so putting the device into a low-power state only makes matters
worse: the subsequent transition fails too, and the PCI core then warns
that the callback returned without saving the state.

Check the return value.  If the state could not be saved, leave the
device alone and return success, so the rest of the system can still
suspend.  Leaving the power state untouched also means the PCI core has
nothing to complain about.

Signed-off-by: Francisco Beltrán Millalén <fbeltranmillalen@gmail.com>
---
diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -541,7 +541,17 @@
 	if (retval)
 		return retval;
 
-	pci_save_state(pci_dev);
+	/*
+	 * If the controller is already inaccessible, there is no state to
+	 * save and nothing to put into a low-power state.  Leaving the power
+	 * state alone also keeps the PCI core from warning that this callback
+	 * returned without saving the state.
+	 */
+	retval = pci_save_state(pci_dev);
+	if (retval) {
+		dev_dbg(dev, "--> not suspending, device inaccessible\n");
+		return 0;
+	}
 
 	/* If the root hub is dead rather than suspended, disallow remote
 	 * wakeup.  usb_hc_died() should ensure that both hosts are marked as
