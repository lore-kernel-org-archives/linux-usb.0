Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D417636B906
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789051639; cv=pass; b=I5+JIIoeZRSyHDBTNcUTeoLfBz3MtnxlWYpywpSXO9fY+r3ohPT9GOR5/pvz31NiwoQ3b6kwX4KFF5V2QAWIWoZUXV8+gqD2KwGqYsccbOGfmfeurLZ5DPkuzkwwghPGcfPf7m8b/iwW14uKPq1zvrOE9UnlDHapy8GrglolwPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789051639; c=relaxed/simple;
	bh=FcKa3GDpNQlGeGx/ZlUmyLDwgumO6DS97C+OnMj8H+s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=IVe32giq5NP86/ZOZL0IunhZndCnrHXiNAKZQmxJQxQZhc9al5Z5rHSmDrUBa8pWfLcfElQIyTHSNm53w5oIBakuoGO2dz/rJHv9DKP4bcmmxcnzRoUFQdIhxV5vZB8RisokVl3POyVwpwHFkwHxQLGtI9I7fmeFeBAjz10IkY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pm23wsdw; arc=pass smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pm23wsdw"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-396a51b2605so2960611a91.0
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 07:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789051637; cv=none;
        d=google.com; s=arc-20260327;
        b=ZfVao0Bf28pDebQwGy0k5gPQT5CgPGIBJDLkccJFGa6NJgiXLJfI6xfq71ooBD8has
         mYBeUalPGwN5JUbDzDM1NB5TumHYQID0xSdu/ek0lrmUp246vHbAomJ2Kbax7ufYzi6x
         uTyNH5wBU7s44983XfH3WoKXUH0l1BjR4gazVJwEFco6HYbBafAfPuaXTEUPhHG3+Y9w
         fAhOf9545/VHY8yUslWB5kNjSG3UBVIHJzwWr9OkCjXNy+vkwpz7Oi4V2rp+wOZYox4n
         Ze3Mym8asNjIat3qh/PN1ovD0NyGE5GIgErcLFZYtK3N5+0BgAomlKBfg48uUt16Mvjd
         bm5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0I4S7TxcWO7etWBolEQHprlfGVHVPvhEGdWvS3KhUOU=;
        fh=/GOGXKy1WWO2h92cvxBBf9jrMM71MC/65GCqPdy63lc=;
        b=WppchWF1a20FgYLtOAu1GEJDBtW56usG6Rcxct4nlkrL165Sinrc9mCSQE1R3eURw5
         dktOG5ZmkioLQy1c+Phm4fmkbUbUbfCF/nBnc7jRSHtPeJvRaorsxdzjgy1ppv39xdFX
         zDbWNNjOavgDo8WMudt6pj8UjOzcoSUKnzJcF9vPsAFth2SFjjSeg5/c1IUU6Mr3agm9
         S7Hk8/9KK58vGSmhaWsYWJps5BEW+R+eSoTsqLiXmoZAdOXgQYLnPErMpnU5z4pUXXh/
         IuatfD+G4dQQru/0ziv2ydGhOIoIv9HrZWAKyg10p5xONcI1+wm0eMQMwAcuxLhHt5IO
         mlIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789051637; x=1789656437; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0I4S7TxcWO7etWBolEQHprlfGVHVPvhEGdWvS3KhUOU=;
        b=Pm23wsdwsyfzkb1t8Gk5jT80MAYFOEXg2Y7r618mv11I95gSXZWaAXgQq5CUwrHtgM
         B8w1jFaR9d62WVA4gU90CSXaDb2qnlezfQoot1pETirMC47Re0mStMCDw4/yUYQuwdGC
         rbmjfXgsgsTqia8DtkBaNj9azEPf6tYYnZkz6baMQuq9AjLv4F4cPD3PUlJSudwCKeZE
         sbG2pCBtNm/Y3uOg6cWB8VyaVdaiH2SmHfodndYT4m78W7orM0BY6AhQO8OyNFvXqcW9
         AvYL4xE5SHpNKIxtdEIRF3wGeYkp0k8DaWfVHlZTpJEG7yz/T6C9zlyTAg4Kv8fIypUv
         /0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051637; x=1789656437;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0I4S7TxcWO7etWBolEQHprlfGVHVPvhEGdWvS3KhUOU=;
        b=ISsNsg61O8w6McRpCBsm5G+UByQ1spVkh096poVDkX7Vq2kE0TtmGyazNny6iuXKob
         bKr6YKkPNTo5n/pnB7qQaXEIct6sds9+Mhja7HBAMHjDuiJceMRQCwV7WMT9+zJr+ZJb
         6mVo5yCCe8pDZ9X4ZJC4OFv45PwZm+qlB+CoA8Gk1evklsaqvbSe2QW5MpzxZPqAGzBT
         X+9vRXiSWLczbeitXPklZcuKqQqGMOIOGPeFiffxgFTNkTIXzme6VFgr+5m5obgQvpaH
         JMRUVXWzcXv97MMMIq7HG+1yt0bgcEvA8dgrYZPyYMxMyG/5ggRTG5t364BEAHJrkwSg
         3X5w==
X-Forwarded-Encrypted: i=1; AKwUvBynN1VlxqsYbAKfuArZTzcor9H1/eKbOGUHl3gUUEmdw3ttLnrgoTlkZy+Br6LdomJBs2JcPLqi7AU=@vger.kernel.org
X-Gm-Message-State: AFuF++lUdXWdW0bSmrel5ylFZPSpKMxFxcsB+xKYatsc6eHC/GHvj480
	nKOQ0vop1dziED4JMzkbCg8ZKRN5QyvH0luMa68nyGsVxetcOH8JpP7z6bYyrDW6GSfQBWzhSSy
	fmVr+MqLN51Qeqve219iEJ/n5/vD24YQ=
X-Gm-Gg: AYBFou23+0TPWllC5op+MocDiP94ZTi1CVlPkDR3MLmeiX1JzExYjPf8aGTc6zKZEys
	WCDNDlbWYj6MuS/m4l/7WF42wYafcLVrk9q0CWI2uZZCevpM3+q7q+x3kbQzet/03BNIAqZBqij
	AVWSrXIHdouyCRGw8v156LHoHXpA2Lr+5bIcqSWezALghcNwHJvXnHbkY6yLqYzvL9VOPPdyXqV
	LjuYCY2npnoc1YLn8eBpaBuaOB2EOqvU6DhMZ//V8/njOT5m1xIT0e0Bp+SbsAsKan41s4CKjCD
	JIBPVeIQ9A+LJYIwOUydiGzeHyh5p6V1Rbm0oI92xAZShHPVxTBuE+z4xEkdVR3qLs0+rQ==
X-Received: by 2002:a17:90b:2ccf:b0:398:a2a3:b631 with SMTP id
 98e67ed59e1d1-39b262aaf3dmr66063766a91.19.1789051636990; Thu, 10 Sep 2026
 07:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Eric Lin <ericlin050914@gmail.com>
Date: Thu, 10 Sep 2026 22:47:05 +0800
X-Gm-Features: AcwNN1XgLNv6JuW5S3gbLLx69aCTMbsFoHrs5XI5Ub2o_qUIYbs9MmGoZifWNHY
Message-ID: <CAFb0CM2Rh7uRYmqY5coE3RoGT1F6NAuO2qr6dU=K4W9aZKVuAw@mail.gmail.com>
Subject: [BUG] Usb fingerprint sensor constantly resetting on MSI Prestige 16
 Flip AI+ C3MTG
To: mathias.nyman@intel.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi! I am experiencing an issue where my internal USB fingerprint
sensor enters a continuous reset loop on Linux

System Info:
Laptop Model: MSI Prestige 16 Flip AI+ C3MTG
Device info: Bus 003 Device 002: ID 27c6:6090 Shenzhen Goodix
Technology Co.,Ltd. Goodix USB2.0 MISC
Kernel Version: 7.3.0-rc2-1-cachyos-rc
Linux Distro: Arch Linux

Behavior:
The device repeatedly disconnects and reconnects. I have tried
disabling USB autosuspend via udev rules, but the reset behavior
continues

Relevant dmesg log output:
[    0.728290] usb 3-6: new full-speed USB device number 2 using xhci_hcd
[    0.852232] usb 3-6: New USB device found, idVendor=27c6,
idProduct=6090, bcdDevice= 1.00
[    0.853030] usb 3-6: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    0.853035] usb 3-6: Product: Goodix USB2.0 MISC
[    0.853038] usb 3-6: Manufacturer: Goodix Technology Co., Ltd.
[    0.853041] usb 3-6: SerialNumber: UIDEA968203_XXXX_MOC_B0
[   10.774839] ucsi_acpi USBC000:00: GET_CURRENT_CAM command failed
[   30.365584] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[   30.605812] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[  425.108819] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[  425.368738] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[ 1265.198999] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[ 1265.447057] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[ 1283.745362] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[ 1491.845657] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[ 1492.094664] usb 3-6: reset full-speed USB device number 2 using xhci_hcd

Please let me know if you need any further hardware traces or if I
should test a specific kernel patch.

Best regards,
Eric
