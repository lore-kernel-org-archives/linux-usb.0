Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF95315D40
	for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 19:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784318046; cv=none; b=BeymcGAwQt+jx1StEni3HHIPPJiQlBD5tjWEd2EpCx3mtg3uhJQE+yQOdkD1GP0rU/X8KKmZoeVUzG5Fph8384RPQWGH2iXR+GzjEVLXF1fRT4Bz6L/1eIIDT5U4+G4qtxoxesEnhk4hs6HG0PLJvRQs0C3f+NDCde0IFRaXwA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784318046; c=relaxed/simple;
	bh=qDEL+NdYHAMBArrfQo7xo37wngGQUozp4Fd2l50ofPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dEv9DNljFqIdxWvjGms07Y7zG5JThKBnzLZo85oYbmNhYMb2hNbtCvG/2kV2ee+/IXVWr0t6Bk3x+hqQjqp4dPKiVtHQ/tbZINLryj/gYecW9oamnBa4XBgKQLqI0w/sfi23Ea+6f6f+c+A82RaMHfY0x8Xt8UGk4yDmdOrqz8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+uxy9AU; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+uxy9AU"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cb5a6aa8760so334620a12.1
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 12:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784318045; x=1784922845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OErWzxQXSQHPfYViK6AsSVvyH9H9J8o7igncn0U/Abc=;
        b=L+uxy9AUZC3kEidm+53y3EJTc7PQo7VYY36st+YyDjSGKiA59gU1ARKuXr93lIvTuS
         9LoCifD3NuTzEWYiY3B2v7f09wUfe9SLBRbhv0xAeC1DUPKMJ/HIRYweobUd6rx5a6JW
         i0vk/u+gGJoGWkd7/iaPFH5UPX8+4hezyzMjGfVCuZRzEMLU9HZKJQK/A9a1qBnUmccy
         ARbITB2d8E4nPPl5432QId6U59i0Op45A3C0thrkNKoRDaua+3ks/LJE2yjXqwe/KDbO
         l9H9zKCFV9BCMRVSIuZmI4tHrFFXRwqLDh/4PcuHaIxwfUUgniRL3L1bLx2H67gagbTo
         wGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784318045; x=1784922845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OErWzxQXSQHPfYViK6AsSVvyH9H9J8o7igncn0U/Abc=;
        b=S7KSG4lVFcxAQa/S/YdJXspIN68agFQMclnG6wyRCex2G+I0XQs8Awe+8s33EllxW9
         hPy6LxHv6EbejQKZ677ddMqblHqRMRkd4J3jVIw9C7KODK1ZBk3d8BavDqqPsAYpvoDZ
         +blm9dX2wPOB/68iDg1aCrZ6pqgJCNF5QkVYL1+PH4Ir3UmU7KcovfKCq5+Di8F99h8U
         CkASSZcJ7M25e8poOV7dUR0u8kvLDNOGEcjwuLbqv0qqdojxc9XVFMv6q7vOz8D+9kyK
         hC6DcldG3givdDrnKFZWLFbtdRqZHj9ML4r0Zs0FLokqbo06VU9Nwp3v/Ts4gDCgWNbW
         TCJg==
X-Gm-Message-State: AOJu0YwwIm9MlQa1uGT5Wdf4hMluSM/OTFAzf09uIebDj1zDhyEPp5bV
	qzyn7kOCoZdO/BgTUhAvhf8el99uPbG1Okf3dRCjS/Co64cxFGwmrRGf
X-Gm-Gg: AfdE7cme5N+KNCJjWSDMI48o8RKKs8IoNVv3eSsIC6SUEXeKujACkn0XHnnnw9pZsMk
	tZPWc8UTsDxNECuoYp43Xt6hDO6bKOvWwqkK+ZchnhAGbcF2p/fyM8w5fIcc/EiemoOcCKdScYx
	i6zzQY81AwCII+KPAHBULhUF25WiHsZg7M9Li6krz9zPlGoMNknV419owwqghEuffz4S5l477q/
	duvek2GQx+ewLHX0UZCrCKLYS3ONCveJcxv3dDDYFaqg1XdSQ5zfO6rrLddoryy0PFmuJ14flRq
	U028tHZJfR+TR+AT/6I2MUNmdF2deRMxCHBv3aEIKy1Mt07q6nFKDYhPUvrIt00JA62FZvbwgsa
	9RAJ0VxBJomjv75rm8IVnWKLtdOAxWmQMcAeMVwBJLt9tmwQF98iRD1+54htCTYoBDGcH4H5ECT
	wKZ7lmrF/OsCs0L6OFPrydQ/Gs/4H11nGNqKaTHhWUFkE7595Kot8Q7P4Sf5ZUHMMcmGewVBSJY
	wVy
X-Received: by 2002:a05:6a21:6813:b0:3c0:9c19:b27d with SMTP id adf61e73a8af0-3c3adb1f025mr4919860637.75.1784318045058;
        Fri, 17 Jul 2026 12:54:05 -0700 (PDT)
Received: from ghost.localdomain ([103.170.252.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2dcdsm7103119c88.1.2026.07.17.12.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 12:54:04 -0700 (PDT)
Received: from ghost.localdomain (ip6-localhost [::1])
	by ghost.localdomain (OpenSMTPD) with ESMTP id 7fc67677;
	Fri, 17 Jul 2026 19:53:56 +0000 (UTC)
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	stern@rowland.harvard.edu,
	michal.pecio@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	stable@vger.kernel.org,
	Nikhil Solanke <nikhilsolanke5@gmail.com>
Subject: [PATCH 0/2] usbcore: Add quirk for 255-byte initial config read
Date: Sat, 18 Jul 2026 01:23:34 +0530
Message-ID: <20260717195336.98500-1-nikhilsolanke5@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a quirk for USB devices that fail enumeration when
the initial GET_DESCRIPTOR(CONFIGURATION) request uses wLength=9.

Patch 1 adds USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE which causes
usb_get_configuration() to use wLength=255 for the initial config
descriptor request, mirroring long-standing Windows behavior.

Patch 2 splits announce_device() to log device identity before
enumeration, improving failure diagnosis.

Nikhil Solanke (2):
  usbcore: Add quirk for 255-bytes initial config read
  USB: hub: Split announce_device() to log device identity before
    enumeration

 .../admin-guide/kernel-parameters.txt         | 10 +++++
 drivers/usb/core/config.c                     | 39 +++++++++++++++----
 drivers/usb/core/hub.c                        | 16 ++++++--
 drivers/usb/core/quirks.c                     |  4 ++
 include/linux/usb/quirks.h                    |  3 ++
 5 files changed, 61 insertions(+), 11 deletions(-)

-- 
2.55.0

