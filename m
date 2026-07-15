Received: from esa.hc5016-32.iphmx.com (esa.hc5016-32.iphmx.com [207.54.87.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1D3448CE6;
	Wed, 15 Jul 2026 11:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.87.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115748; cv=none; b=UBZARMePRjJzoAWi6Jhxdj/CEP8J7ZItT1put1WXkTcNC8qH+QaaN8//b23OcQsXuerq6r+Dy5p7gnn+EwDigUGRTzsUczdZ52ZOHp5bYcBvI6B02dHG4vWWMCTHkIwiQiDytGHGjylGxqnsivqB7dUMQPiD9Fb3HCCdDzC8e2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115748; c=relaxed/simple;
	bh=yE79iMsYJO5Vrf0B06E4PthQmw5hfTQOI4SanEQbe0Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SR9PwZXEtRo6n+N24y9G0g9dWVWB2V+LhaBI1CjUI1trOqgk6LHY8wJn0AVPJvyB9M+kb2KQRqYUIGn2z1rArDzVcW2E4b2zNnrHLhgKDchuo3ziANTCw4SBOZr1DBsl+u/ogW75pxEl9++tA7wPF6iRwv65m/Nbn3sxCwNdo1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com; spf=pass smtp.mailfrom=harman.com; dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b=fQtpzkvJ; arc=none smtp.client-ip=207.54.87.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harman.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b="fQtpzkvJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=harman.com; i=@harman.com; q=dns/txt; s=CES-HARMAN1;
  t=1784115746; x=1815651746;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H2xqkURba62OGwEGnf0dQ43RmnUK9Mj9UBxrIxoBDjg=;
  b=fQtpzkvJLADpYOoJwizsDz5g7drloSH0P8Q66pztMZw7jhEjGRzN9yuL
   a2z5jmWt2vtfl1GycCxOInKI0BJwdKIMfddjLw9CInchcDyIdtOlIDqAk
   CFHOMw8Ydgjgeus7HtFWTn3vZG+E+5/ykPk0HRj4zCAgGioc2eQZCoypa
   yAbtuv13zq2niorfUF9wtomB+1sQw5UfVAs171WXd9vY36ljoLcrvHVm/
   OvlSE4ajsdnAIdNiS0JAT/A0hF2EzZj5BWmGW3GV0vsrkDuJUd9vMo/rp
   Wv+Pt8gIeuFH3ajU6Qee9Hp/sA5bnJTFZXnceHailYT77OYsqtPIbXGZM
   A==;
X-CSE-ConnectionGUID: fURXPZS8SMGiFplKTwB0AQ==
X-CSE-MsgGUID: /z/PI87GTXSqrXoOZO4T9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="119143015"
X-IronPort-AV: E=Sophos;i="6.25,165,1779163200"; 
   d="scan'208";a="119143015"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO INMDWSHYB09.ad.harman.com) ([199.27.113.4])
  by esa7.hc5016-32.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 07:41:16 -0400
Received: from INMDWSHYB09.ad.harman.com (10.92.6.246) by
 INMDWSHYB09.ad.harman.com (10.92.6.246) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 17:11:14 +0530
Received: from awsmblx423bs002.localdomain (10.63.34.68) by
 INMDWSHYB09.ad.harman.com (10.92.6.254) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 17:11:14 +0530
Received: by awsmblx423bs002.localdomain (Postfix, from userid 530975)
	id 21FDC8BC04; Wed, 15 Jul 2026 11:41:14 +0000 (UTC)
From: Akshay Gujar <Akshay.Gujar@harman.com>
To: <gregkh@linuxfoundation.org>
CC: <Akshay.Gujar@harman.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <naveen.v@harman.com>, <oneukum@suse.com>,
	<stern@rowland.harvard.edu>
Subject: [PATCH v5 0/3] driver core: add enumeration failure uevent helper
Date: Wed, 15 Jul 2026 11:40:25 +0000
Message-ID: <20260715114028.3627807-1-Akshay.Gujar@harman.com>
X-Mailer: git-send-email 2.19.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hotpluggable buses can detect that a device is physically present, but
enumeration may still fail early due to protocol-level errors. Today,
such failures are only reported via kernel log messages, with no
structured userspace notification.
 
This series introduces a small, generic helper in the driver core that
emits a KOBJ_CHANGE uevent when enumeration fails, and wires it into the
USB hub enumeration failure path as an initial user.
 
The USB change is intentionally minimal and serves as an initial user of
the generic helper. Other subsystems may use the helper independently if
needed.

---
Changes in v5:
- Update ABI doc (date, version)

Changes in v4:
- Remove duplicate kerneldoc from device.h; keep only in core.c
- Clarify @dev description
- Update ABI doc (date)

Changes in v3:
- Rename 'parent' to 'dev'
- Remove 'id_name'; derive identifier via dev_name()
- Improve comments and commit messages
- Add kernel-doc in device.h
- Update ABI doc (date, version, example)
- usb: hub: pass &port_dev->dev directly

Changes in v2:
- Move helper from USB-specific code into driver core
- Add ABI documentation
- Split into a 3-patch series

v4: https://lore.kernel.org/all/2026071012-hesitancy-doornail-3dab@gregkh/
v3: https://lore.kernel.org/all/0b39693a-d8b0-4c95-97ee-07b3882c4b6a@rowland.harvard.edu/
v2: https://lore.kernel.org/all/2026010726-grimy-variably-b10e@gregkh/
v1: https://lore.kernel.org/all/2025022131-silo-impeach-3f24@gregkh/

Akshay Gujar (3):
  driver core: add device_enumeration_failure_notify() helper
  Documentation: ABI: document DEVICE_ENUMERATION_FAILURE uevent
  usb: hub: send enumeration failure uevent

 Documentation/ABI/testing/sysfs-uevent | 25 +++++++++++++++
 drivers/base/core.c                    | 44 ++++++++++++++++++++++++++
 drivers/usb/core/hub.c                 |  4 ++-
 include/linux/device.h                 |  2 ++
 4 files changed, 74 insertions(+), 1 deletion(-)

base-commit: 0f26556c5eeea62cc934fa8938b148aa5844a6b6
-- 
2.19.0

