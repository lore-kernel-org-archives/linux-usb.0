Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3364441D4FC
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 19:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278963; cv=none; b=auSax5uK3jHzpLuKXOo7A4jwc9flLFB9crPfqylGBgJU0tWrzZ8nylwK+vWO8vzOx+8/oGps7i7vNEvLlCwqF0Xx9gpTyboDoGUmQG9HK+MNzwVcR08JUbYY1daqP869I2Cyp4k95Nw0JDFc/lNXgtkaO2jj0VaevaWnXFVR6qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278963; c=relaxed/simple;
	bh=zIbIrMzSJDvDYBgIkEwYRPpVBywOrf5wHV9beNe9Csk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RLpmjBiqrEdvre0xGE8rDfmkbgHF6RzWMvTRCYRUlGn/2JbyOYpe0/RgX304jMo6Tvq+V6MwdNhDk2eNhF8YBO/lgLjMXc7x5HXvJnGuPQyxDb6aHbMeMorJVIO0a9hvVgXFI4jeVpRqGtdZCHE3eq7SMaOkXd7GM9eDxBdVcUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFZMpI25; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFZMpI25"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so1047985e9.3
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 12:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790278959; x=1790883759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LgnXoD/BSCv5lN5N25xk3q9G7OkECA3zkXLqZfTADaE=;
        b=MFZMpI25BePn+vnWqqWZabsu07MNqEFn3Q49M7yE1ii/t3tWv2NZru+kqLA5nXh3Qu
         I8uq57ex/gBL1ilv4f2p1MS8ILzSLs03yUfm/iVqqcnTrKQVYvOAVc6AvnfVhjaJVl2W
         rJ1DA9BxZyI79VeEGDrDz6sNAXszCRxsP221eC3oHrWZYv6o1lkzumPaZP9kBFvOSs0L
         LkfUVtHli+AmmBEFXXwGq4EE86ge8Z8sWkwGxN6PdVmGhdm23SRcSvaY80oRaxsROtP4
         uLMw8K2Rwg7uDg8E8ffccYCqS+cfbFA8ZzIFwDKHlqEdZWesM+uIxVxG+VKg/1EiYg4U
         svsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278959; x=1790883759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LgnXoD/BSCv5lN5N25xk3q9G7OkECA3zkXLqZfTADaE=;
        b=WZLHbPCu1ZwK6hnfXa62ail/jb9k11JvO25UQttjFOptmHZVlXEyNJLbfFUysSjCnV
         8gpFF2WhAvGVWiem/UdnD+Qg+3MV7leDwYvq16adSwS3TdfjxNJKcI3yJ1CgXKH7RAxx
         ssT4nt0ojxHH2R1trNyPNv9WOmeHAMt7lv9hn0bcHzQWd3jycC3aClZDAuY+TC3H4xzU
         XfWmC5gHRKn9+No2w0qSxzZRQ7GZ+vbnBqar4s5CaRUStQlFneb+ndvuceKWQwn948Py
         NTEqBbo4H5WpwaSWbQ12CleHjls4DJQq7CY+yL1UlyUruK7ZJVT3pfA1Ac6Fb1ZSR/HI
         okzg==
X-Forwarded-Encrypted: i=1; AKwUvBxZE1w2jLRPwvwrVBi/CI4ZWv8HNBFJqFZh5bGMJMy9HXv4uXz4tkKwfR0Yng4TLiHyxge+48IAufg=@vger.kernel.org
X-Gm-Message-State: AFuF++nwHJVN/g9awRGgNlQoCaiHp7FuuI/zT/jZ8qPzhL0j9FpophJh
	QmGv+D5VPk6Zb5EKRM7oWWKq7UtA2sbwFGxFvxgsHkDPVlIVijGmkmLt
X-Gm-Gg: AYBFou1I+XsW3dXkjP7DPZuQk5jdSNJaWtzjx38OgjnRCM8hhbGkbrW1l9XqBAbGxe5
	gg6WJuBg9DcTKCSrnvHzyVqRULO31Uuf0pJ9cnhPW1Z48THE/yu5mbuaAJ6iNRbgcNxvaZ0mBO/
	+lb39pPK1m0BgnynfQiHU4MlVjRjUsoIfK7w77E66zpFnCAKgcvygb3/VMQAV92Y8+D+AgEYyWx
	bfHjp4CYK8nSWVDxohK77vngo7uhOrc8LJwHey5R6sTn5kOBaDIJZGu0An/+uHj1mUEZgu9m2sT
	Xji52+rfS9aPJ7EFu4Snv7D59uj4ELTteoXe0l+ZPoL9EQ3bbvNwEAcAiYkdPw+348dlaqhozbD
	yOg6BQXqCaACOkrX9FqZnXVzSvXZbEcM4fhWwmT+amtU/2a3VD25Ft5Umbp8yYR1LKFy0uRkZdj
	aSaba+1Qe80AvBSmSgahhDSqnXmvk4PopVstFBiyrtCCNliPDpjilYA/3yPGlK1GRdnprcjyeWj
	Kh0nqelsQfzlRari4mN6hH1pLLr4MmomoHpcBhn4kDuhxzTZyJ2sBHY6+qI4WVhlEtigzDCp8Sy
	UQ==
X-Received: by 2002:a05:600c:5493:b0:49d:93c:d903 with SMTP id 5b1f17b1804b1-49ff06e509cmr312365e9.20.1790278959036;
        Thu, 24 Sep 2026 12:42:39 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b4d45sm935105e9.7.2026.09.24.12.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:42:38 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	syzbot+3fb7629cfd12d04beeab@syzkaller.appspotmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
	Peter Chen <peter.chen@kernel.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: phy: don't overwrite a device_type the bus already set
Date: Thu, 24 Sep 2026 20:42:33 +0100
Message-Id: <20260924194236.168010-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_add_phy_dev() replaces the device_type of whatever device the PHY
driver passed in:

	x->dev->type = &usb_phy_dev_type;

That device isn't ours.  PHY drivers point x->dev at the device they are
bound to, and its bus has usually set a device_type up already.

i2c is where this hurts.  An i2c client keeps its release callback on
the device_type, and leaves dev->release NULL:

	const struct device_type i2c_client_type = {
		.groups  = i2c_dev_groups,
		.uevent  = i2c_device_uevent,
		.release = i2c_client_dev_release,
	};

usb_phy_dev_type has no ->release, so once it has replaced
i2c_client_type there is nothing left to free the client with, and
usb_remove_phy() doesn't put the old type back either.  Removing the
client then hits the warning in device_release():

  Device '0-002c' does not have a release() function, it is broken
  WARNING: drivers/base/core.c:2642 at device_release+0x1de/0x280
  Workqueue: usb_hub_wq hub_event
  Call Trace:
   kobject_put+0x162/0x260
   device_unregister+0x27/0x30
   i2c_deregister_clients+0x27d/0x410
   i2c_del_adapter+0xe9/0x230
   i2c_tiny_usb_disconnect+0x3f/0x90
   usb_unbind_interface+0x1e5/0x9c0
   device_remove+0x125/0x170
   device_release_driver_internal+0x4e2/0x6b0
   bus_remove_device+0x2f5/0x470

syzbot gets there with a fake i2c-tiny-usb adapter: instantiate an
isp1301 on the new bus through its new_device attribute, then unplug the
USB device.

Only i2c is affected.  phy-isp1301.c is the one i2c driver among the
twelve callers of usb_add_phy_dev(); the others pass a platform device
or a struct phy, and both leave ->type NULL and keep their release on
dev->release or dev->class->dev_release, so device_release() still finds
one for them.

So only take the device_type if nothing else has.  Callers that rely on
the uevent handler still get it, their ->type being NULL, and the i2c
client keeps the release it cannot do without.

Tested on x86_64 with the syzbot reproducer: before the change the first
isp1301 instantiation panics on unplug, after it 292 instantiate/unplug
cycles pass without a splat.

Reported-by: syzbot+3fb7629cfd12d04beeab@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3fb7629cfd12d04beeab
Fixes: a8534cb092d7 ("usb: phy: introduce usb_phy device type with its own uevent handler")
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 drivers/usb/phy/phy.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
index 5a9b9353f343..ded18c7fe32f 100644
--- a/drivers/usb/phy/phy.c
+++ b/drivers/usb/phy/phy.c
@@ -705,7 +705,13 @@ int usb_add_phy_dev(struct usb_phy *x)
 	if (ret)
 		return ret;
 
-	x->dev->type = &usb_phy_dev_type;
+	/*
+	 * Don't clobber a device_type the bus already set.  x->dev is the
+	 * PHY driver's own device, and for an i2c client the release
+	 * callback lives on the type.
+	 */
+	if (!x->dev->type)
+		x->dev->type = &usb_phy_dev_type;
 
 	ATOMIC_INIT_NOTIFIER_HEAD(&x->notifier);
 
-- 
2.34.1

