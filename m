Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6374F2F12A1;
	Tue, 28 Jul 2026 02:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785204351; cv=none; b=Z91JfLl/5wT1bBLe+yx1751iFb8cnCCODVdODvZNWod6lUMnbrGXWBKTW0ASTMExztok252yK9WWToxd/CmOihk09sb6uAovV6CsklPimvubGqmel6wrKkysMga88D+tMbR2ZtVyklPvTZtnDOeFL/NkxxgTqbsd9L/YWq6I0eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785204351; c=relaxed/simple;
	bh=jCTdM6Z9VKPh2s4rmrnvqB8RTQyGI+rK9dyLf+39Gpc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sv50VBAD1LrJUn1aAfk/2KKk5gJJTHxCCFhOasdHZKEbKRw/ryN3yGVejv11MbUklcd2XCQD7Yp/bbtsQy09YOOJ5L6zd/Ci0b3044gjovEPwM6a4HFqzj9QEotqYH8BcKXvmzweV+G+7BEpzin8fyrBVho9+VQhxi0KI5EHaSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iRwU35Fd; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="iRwU35Fd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=nr
	4nlS1J7g4Sn6RCtE4OjuzXWTEdeQ487GQIIRpD14U=; b=iRwU35FdWONWCwluuW
	t19Y8og1NFGy8C1FicEN+534kdnFLdANxnKXUFOBe/pd8WZcqwOC+c96y69VjpdT
	mk0xgWXurNcG5BQc05S/VV37DBMxyKHHIk6/gORq5FHVUJK3WWsFqJXPnEwTjBct
	wn//aNKdcLd2gqWfvW2Emtc98=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wA3JPJODmhqLAerKg--.42S2;
	Tue, 28 Jul 2026 10:05:06 +0800 (CST)
From: Miao Li <limiao870622@163.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	limiao870622@163.com,
	Miao Li <limiao@kylinos.cn>
Subject: [PATCH] usb: quirks: Add DELAY_INIT quirk for Kingston DataTraveler 3.0
Date: Tue, 28 Jul 2026 10:05:00 +0800
Message-Id: <20260728020500.94492-1-limiao870622@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wA3JPJODmhqLAerKg--.42S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF1DGF45CF13ZFWUXr1DJrb_yoWDKFgEkr
	n8WayfZ3W8GF9xtrs2va1SvrWFka1v9ryvgayUtFy5Ja17Aw4rZFZrJryDZF1DGrWqqFsr
	KFsrC3s5Zw1xujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiNeO5UUUUU==
X-CM-SenderInfo: 5olpxtbryxiliss6il2tof0z/xtbC8BJMGmpoDlKBmQAA3y

From: Miao Li <limiao@kylinos.cn>

The Kingston DataTraveler 3.0 flash drive fails to initialize randomly
during reboot stress tests on the Huawei HiSilicon platform.
Adding the USB_QUIRK_DELAY_INIT quirk resolves the initialization failure,
this has been verified to survive over 1000 reboot cycles without error.

Signed-off-by: Miao Li <limiao@kylinos.cn>
---
 drivers/usb/core/quirks.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 87ee2d938bc0..c2a81d973a2f 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -419,7 +419,8 @@ static const struct usb_device_id usb_quirk_list[] = {
 			USB_QUIRK_CONFIG_INTF_STRINGS },
 
 	/* Kingston DataTraveler 3.0 */
-	{ USB_DEVICE(0x0951, 0x1666), .driver_info = USB_QUIRK_NO_LPM },
+	{ USB_DEVICE(0x0951, 0x1666), .driver_info = USB_QUIRK_NO_LPM |
+			USB_QUIRK_DELAY_INIT },
 
 	/* TOSHIBA TransMemory-Mx */
 	{ USB_DEVICE(0x0930, 0x1408), .driver_info = USB_QUIRK_NO_LPM },
-- 
2.25.1

