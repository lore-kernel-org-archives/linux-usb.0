Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F833CF670
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 19:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182092; cv=none; b=WxL1Bz7TMGCJp3aFL5ZQuoqH4wjjaRbcpzHdM29lrcgC4Pw6enh6+kA4z74EAzOpnztEJ6Sr7J9beoARYHRaYvxtYO9XS3nkkxf/CtRsUCigWsYaRAn9aHIfOBFfJgOe3sV2vALrR5+GBeCRcaRkHOxGmW0ZPcKP3Xpkt0hMnS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182092; c=relaxed/simple;
	bh=JyBUjyxL7nT4ZYclweO/wW6mn+OU7uxxJf63SKPKOeg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cS65N0r/u4eenLKWy67ikP9SwiRCyghtxptitIzE0Wg5PCl/eAT3dYtwwfVhOWKvhObu0ipZX98ysDgMVlgXEI+wPbL42boXHKsg7crSdvce9hUGoIqghDzpvftwSVx2NlpGOSaOgn3Ieqm2fhxVMnhyw45BfSfEn6OgNAof69U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqRr7AU1; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqRr7AU1"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3811f512167so2917589a91.3
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 12:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785182086; x=1785786886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uo3Jh0L4b+BG4DFcYUfx+a8EHRfupQuURbh1tRgkMyQ=;
        b=QqRr7AU1JYVbcH0raJzQdjOp6QrzR67IMEdaXIyEFeN7FJooD9s1JsEmGUHjTg3gFK
         3aQPbold32/Olu2+QGL5NqUFK0DtOHnYhoP30zF4Q7Bu6h+BgYZ6rtCBfRpoRKJUMbXc
         wXhQmUr01NsT44HxpYRS9Ocxr8gPmA7Np6afO2n1Zh+1r9UMY606IMpSygDcokZKZ1/R
         4RwZTWZOB9l2aagwl7THeZmmaajiScTrkXpIHD6iFdlUa3hyHKB5B1JSHcht/hYfkv0s
         3vnQl02KYro1JIzEZXQ9cu9B9pjUODTqpsU6BkCgxOH9SMds4Gq1qPFipj/kYYFhC+nL
         9tcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785182086; x=1785786886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uo3Jh0L4b+BG4DFcYUfx+a8EHRfupQuURbh1tRgkMyQ=;
        b=E7EYzjNHvd26hphzXM69DOZ/Qw3OJl/FBfpuSJ8/B9UuxCn7m5cm38cdROXTd1/118
         jdi8D+LxABv79ZcZvKq6zVHhlUn8xefaG2vpGvx0ChJmSt/lk/7ZKUilh8wkhC0djENI
         f8WTzO5YvsvPJbWsQfmRhW5YlNn/1G5GiHM+fBLog2Zd9xg2tcLz4FhoHeptah6I0ZVr
         Y0CQ065hGyD877njzb7TfXKMChrH43ux7AeK8nb45Zz6jzKryzcTmO61wVOio7fOfJMt
         ZskP02XrFp8JVgg+3iEAgVP9mXhNjHvSKkPMAy+Ot+TSeUCKMNbh8ufh8nUdoLiwB9+f
         /c3g==
X-Gm-Message-State: AOJu0YxrlvzTJi73uujm0j4Tu0BHweTLD1EZue9RL6066OBZxY7Tf30r
	8oc64CC9tiCNVkaFJnLbbSelHp+17xZfLWZbye8T1L+S7uXQ3fuQ+rjgrqCT5VPt
X-Gm-Gg: AR+sD127Bx7GsBFRBCexZtZC4DcoE8Ba/x3J493jYc6CsFbAdfwyadjtJVnnVHee14I
	iML7/Gx3c0gf8El2QpNifaZnxArrHPvmFs88KjDnIbpZtc+YBLswq7f6W0Cx20gF7mI21y0qdO9
	t4snlPVoW/yP+iEB3f5E+6H/mhYh72Fd1mgqQoCXc4BWUFlpM5MZxfpZOuaH5zD8tqJQtEKg+Y7
	PyHB3tB5nLw4cwjvgrMfDy9N8dtpxsb36ACCmooB0CtZtOGmSep7RP+srm20xlGb0vVzrXfuimY
	cJRX255HrXsd8mT/f57NLtFEX44nJ+Ya/TD4PiTRQt5DAwuiLitW/+K8aQCZgyR2LouH+gP0IyD
	NGRAEqZN12yCj/tOA9pO2TC3yUX8Hlid01ElsQKN20OQxpDzC7rpqpdtsQ8vYwhvtwQ2EagTS5j
	LmUPL84LWdRCxpure5aXEaSVsNJ12tnpiHuhQ8wMvxQpSzeeoYIPdvLtKYwA0Gr0xvtA==
X-Received: by 2002:a17:90b:2c84:b0:37f:ad36:8fc5 with SMTP id 98e67ed59e1d1-38f64cc9e1fmr539746a91.23.1785182086532;
        Mon, 27 Jul 2026 12:54:46 -0700 (PDT)
Received: from localhost ([103.170.252.6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm57447013eec.13.2026.07.27.12.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:54:46 -0700 (PDT)
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
	Nikhil Solanke <nikhilsolanke5@gmail.com>
Subject: [PATCH v4 0/2] usb: core: Add quirk for 255-byte initial config read
Date: Tue, 28 Jul 2026 01:24:32 +0530
Message-ID: <20260727195434.14626-1-nikhilsolanke5@gmail.com>
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

Changes in v4:
- Reworded comments and messages
- Moved the memcpy() block that skips the second read after USB_QUIRK_DELAY_INIT

 .../admin-guide/kernel-parameters.txt         |  5 +++
 drivers/usb/core/config.c                     | 32 ++++++++++++++-----
 drivers/usb/core/hub.c                        | 16 +++++++---
 drivers/usb/core/quirks.c                     |  4 +++
 include/linux/usb/quirks.h                    |  3 ++
 5 files changed, 48 insertions(+), 12 deletions(-)

-- 
2.54.0

