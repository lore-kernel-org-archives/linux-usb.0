Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF0A470EB2
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 19:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785268326; cv=none; b=MCV3ngSDV4iEE5v4KoFA123w+PRzSNhvZ/xxv/M/eMTVbpcL9ed0scwCa93RJ/U5wBPIwYNoXO8tW1QXCgRN/iwFlhWlI4P6lPF1rOBwnmIlVHZK3tm00YfsJrqlFwlGGufeDm54sQ9V77CZQlCC3nnPUZKMWuTmC2VZlXLSF0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785268326; c=relaxed/simple;
	bh=SFt5E9GYZueOjVBG9UTzsLKlJFq03wyncP/bQf0SmVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DdNXw9nF1QYs3xFn+X9diw+AxNcxFHg8jE4C3frRSkqSWr5tadR+BkQBQsgYJGtWmrWTL7qr0A+W9ekg2+OEcs7yjO/gZRO/zA6WccNci6DRSupArN0mkykUq821b3A0FWv/7hh7m59ScayGoojNJ7YdqWhIDic10lx4EnsOV1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYqct8Lv; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYqct8Lv"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9aea40d799so87138a12.0
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 12:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785268325; x=1785873125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8h2awYrl/UTrjaNT3VD/E+4YhtMvmOlxPVKjv3wgHvI=;
        b=HYqct8LvdLJlv0HhQzAQsokQmMoge13YB9kX51JsQhbqJo3yq8PqfDQT8JBmhTUQw2
         wQyhZP+76EMbISaerUu4iUeEvhN+VBCy90g6sH+fmztxuEtfzvE/xasWgp7ffHm7bbLn
         gdqteMBqilXc3H5E8hrEmeX7okFHzEcoaPZnxjuAoyKDqAIbz1Z/pkOK8ocG3bWzlo7Q
         JxMAN8IdHFF0Jj51p64i8XWpzBUHgbEDiZ+/MwZTiSBkH31rpyJfI8ih3PV9aDOXbmGY
         2AVKTFr1QoZFOvdRt2v1mstZWqctME41+rTeajxKnAh7uJ/lfGGRmdXpSqjZB953cRht
         S1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785268325; x=1785873125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8h2awYrl/UTrjaNT3VD/E+4YhtMvmOlxPVKjv3wgHvI=;
        b=nUaL88RnJOiY50UQb/9R/mQOkzc8SKFx/H4eVXeOCnnqH0xXNf4aBNZa/6isDI/+0w
         2p/KlbtbM3j+EkWJsEwIEnl2tE2eN9CF5PjCERDRldqObHY6mBwX6n9s1QFA805lDBgY
         EV3Jc+0eoB2EeYNvThW5nH5DHVmyF+k3pcbOn9lZuMKvz5lf5uQ4DE44t00xkyP3AY7N
         GZ+NtTQwL+V9HeSyqxt94U0EEjzhs9iug8UPi3rtpvD0Nfds5PFhyu3C1ZlpuyX+kLYY
         3xORsydt37+1fprheXg20MzAfoomxJ7gwCAerIpwXxLhqyIMeuVyihhKv7MkICPicA4Q
         eK7w==
X-Gm-Message-State: AOJu0YwUJ9VCJWWiP/mO0QzGU0hQX2DxXQW73nw1XBbRoFsAj3Jeg0oV
	Ws0C9qwT5gjrMbX9i4hV6VDEVZGy/m2iBM75ZbPtWihFyVm05T0quu+UJmR7Etxv
X-Gm-Gg: AR+sD11qmUaLANNsH7PBrgX1pGq7oPO/L5tqZbCn/AuTFuxSiWn/kdXMRgEIIfDn6M2
	RKxIejL1VlEz4+AEDnJPNwX6IzVs6yyxPVpn5f37G2lDZKvFNAaTKrIm3zPwCL78t5jXmgFBd2N
	nIWTkHXS4MF9yO4plWFDmGzNGtcHNtiVrTaGAmvpVAeVziY1FjhVpowqQ51S6g53GnM0w7bQzBH
	syDanB5PEB0WjQQQFnHMS1OMXgrIw3ftew1uFQyOM3C/dqf32VmaHNjzT1aV7mskcy9ntECmV/G
	fr74H1WB31LxSvsswfptwNfiSWWBQ+ABnnfEaVqRUKftkb9290gObyTE65ezifsfcpvX7xQUJLH
	VKipSbK+YkvF9AcX7AuWR6CNakTY1TxEWUYZngw3oHA6jfXcJjuf4gZcm9oW758Tmen+LuFkGsy
	8iLxsiVmOGytoJMGCLwk1nY3esheFCG7DiFGMwcOjzS5/M9mxRIJTPKfw19MAJ0G3PAA==
X-Received: by 2002:a05:6a21:398d:b0:3bf:c07b:a9ab with SMTP id adf61e73a8af0-3c8ba618024mr4552080637.55.1785268324823;
        Tue, 28 Jul 2026 12:52:04 -0700 (PDT)
Received: from localhost ([103.170.252.6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504bb29b2sm1613295eec.13.2026.07.28.12.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 12:52:04 -0700 (PDT)
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	stern@rowland.harvard.edu,
	michal.pecio@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	stable@vger.kernel.org,
	linux-doc@vger.kernel.org,
	ishaan.dandekar@gmail.com,
	Nikhil Solanke <nikhilsolanke5@gmail.com>
Subject: [PATCH v5 0/2] usb: core: Add quirk for 255-byte initial config read
Date: Wed, 29 Jul 2026 01:21:56 +0530
Message-ID: <20260728195158.65162-1-nikhilsolanke5@gmail.com>
X-Mailer: git-send-email 2.54.0
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
  usb: core: Add quirk for 255-bytes initial config read
  usb: hub: Split announce_device() to log device identity before
    enumeration

Changes in v5:
- Updated Patch description

 .../admin-guide/kernel-parameters.txt         |  5 +++
 drivers/usb/core/config.c                     | 32 ++++++++++++++-----
 drivers/usb/core/hub.c                        | 16 +++++++---
 drivers/usb/core/quirks.c                     |  4 +++
 include/linux/usb/quirks.h                    |  3 ++
 5 files changed, 48 insertions(+), 12 deletions(-)

-- 
2.54.0

