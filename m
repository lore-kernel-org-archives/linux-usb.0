Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D98338D6B8;
	Mon, 13 Jul 2026 15:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783957484; cv=none; b=cIzX7MfNG18EnQb9jhclve7gwoi9xON1xxHdHzbl+2yVGx6Y8FRREaViJnFO4w1IzQxiHEjvTacjEeH1G/sGhb53weNrcKwfyiEyHoQRh1ZxmWWviJB3+5FLuwlkIwfo5DUcVV6thAEczu56LaIopvRXnspeI9m4SRSQQjreCa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783957484; c=relaxed/simple;
	bh=vWUbaBwsplVgWupnIAu2K9+jTRYPRmZ8Z27CrYGM7Sw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bkYs/ZYtcq7N3/rq01ohGbVmCiEdowk3OL5bDY9D6EhDYzVbokzNOCBD1hrRJN7vP/7tsHGvgaIJ9BCccEhPXRzoRKLA3LAwLFRNWqD0HlJyWnw2EBw5rH9wtfF1L8mNtV1ytDz3FsSASolh/qbDMYGckf3FMCzvMdd3SUiNEqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Q4oMf/1f; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rNMe/gGZ; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Q4oMf/1f";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rNMe/gGZ"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7BC3D140018A;
	Mon, 13 Jul 2026 11:44:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 13 Jul 2026 11:44:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1783957478; x=1784043878; bh=Sc
	KjDVJYPIYyftsmkuduBGYV0v+zkoRZBTWycjoAcYI=; b=Q4oMf/1f4XSsspmMLP
	Jci0i5m1TUxp3g09TfhVId+AtBgffjQxDJGiAvMIf/l5OUOE1sqtWC/UmMcPmrYv
	LgM6Ie/e86Yvc1rXLMfwHbAiPxsSp9dUn936ccLge73KzUTuZFFY0KGvuM3xhn91
	vhRETqVeWAIkh58tS0E9SXwp0UKdY+hrQVFl3bscb5IFyhu2pTJmsTuYox/W66g5
	OKwdTHozkzsel5jtKN7faXjVK1m5grYzN/NBJ2WgnnyJ+utl84eYXED3nmDRTanI
	zRefbzPwS8PKGKv2Bn2VoLVXrKMHhxOllufyJqAxSudQ2Z7SOPGzqOyE2ddUccDj
	GTOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1783957478; x=1784043878; bh=ScKjDVJYPIYyftsmkuduBGYV0v+z
	koRZBTWycjoAcYI=; b=rNMe/gGZRE4gLJGn0LP5OJiu6cm6ywSEli8WcFRztfzB
	tJJAw+woV1Qz3NKCRbq8vjVEa4wSJcINWjFZi8IWqjlifOQNtnMDvf0NCMGN/vtn
	hllNJCoZSO4i//Sav4cL2o+6an1+/4FPWgsWaoU9+LkKZ2MXnPjQYE1eBf1QTU6c
	dFBMKaq9MsnFmGDsH9i4BQb9B46Vj001RghCrMPji7uEhhCgwB/2o0eLWHqC+j2P
	3o7YunzacMYdlUwClHZQLyfMrpJlcx1XlMB0SYx2xJfnyITMQzWwcSZKPjMg66wA
	r5YOmYfkpyj/sh4iUnZuMqojwMvWRHcenpl3YIEMXA==
X-ME-Sender: <xms:5gdVao1609XHBcFcJJTUHp7CAxDMyaUPv9Kova_Tkm7Bkm5j9l35Kg>
    <xme:5gdVag7qQSSDXrryLSXsLLkEu1v6-VMJYl9Ybm40Y5pIB4zS7ODGP3CWlHmTma53q
    aN5J6PYpf-7D7Yi5_xfJNqATlA7z3RCBYxckZ3U90yqlgJnjEw>
X-ME-Received: <xmr:5gdVarVxgj4Pkg-W4SpisxY6Bgc-WN9bSFgh2ZbV18mM7xh4q0w9XPIqpFV9sis_d05b4lR0U3qCT9PfIBXS6g5oWudDIcnpfA>
X-ME-Proxy-Cause: dmFkZTErh1t8EuJ/lsM2UYf5an2irZMDT90ZPmrULPzOIHSFV+sG41ajxekDPE3oWyZDow
    gyx+kjAq5WJl02qTdf3ive64PMmj5ReODbfEsZYhbr6/fC2EcA0JXw4O/qllvr0ONLFp7N
    hstl5Hrr/pin3Lay6e+VCdivmMMtY1VeEPDBrxjHMhcOv+lGK4kuPpfVQrICULhaFyuF1e
    6pumbz6LZJ/pzx/HCRhtuIdfQEKUgtY3iDhROOKc+BsHPeluZ6AziNc201GBBsuaUmuYm5
    A3cJEWXZglHwM3b0b45USBdHCvhmuVCZ6SUm/wKOY6ySUOuK8XKdQxNeJ4dvSUtAPtSWPg
    KGsWYWAvXbOCjYI4y3bJJx2fA/mVaflmQBk2vNV7jLCzt0+9zxxN2ZqiMDjmCvCB4kKT8L
    NekhaMYcXIaQB1Ghb5FQsgdKQ8+pfDDk0OjaVK0KxuuxeB2VZBP2QZ0jsjdU4OsSPSyQDl
    FXyDii6Z2Ka3ckR03JQdVl3nz1FPc9es4ivHaKbp7m5XGab+Kz67LlSJVEP03rpWQ9msxO
    M6JJczCtueRWa0ZxYH3WZzmOJdkr/P6V091X9paxSnw+iZ3w5DTrOSFWwYvNi4R28+ADdg
    Uo/1mbdSoHP2G91G9wvuA4iXdmIEsA4AZnzl3kquijarvr6CszA07LaFyJrw
X-ME-Proxy: <xmx:5gdVavBVJedw0YTG3U9HLJeGTdFYY5kDZG1T6vZdyGce4Mz7D66X5A>
    <xmx:5gdVaq5KRtfi6EdLhm_3xhpUhDlZwunxWPQcD0uhsvtzpZY9EuxtKA>
    <xmx:5gdVaqwGm6cTzgx4qJu2kcRP3v1knMHuRgCcug5lFl40lGkYxqtRlg>
    <xmx:5gdVahzyopZEAtdHedS8T6ab_vQ0e1uT3w1M4fui0XCJ55ArwzMvtQ>
    <xmx:5gdVavxbZH75xIUTbBTc6SJD2wlCgGPk6ZIsFuFOqFRFkr-_wGOdZj59>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jul 2026 11:44:34 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
Subject: [PATCH 0/3] USB core defense "hardening" changes
Date: Mon, 13 Jul 2026 17:43:50 +0200
Message-Id: <20260713-usb_core_patches_1-v1-0-7721c2b33f53@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6CMBBG4Vchs7YJrReIr2JMw4w/MiyAdIoxI
 by7VZff4pyNDElhdK02Snip6TwV+ENFMnTTE04fxRTqcKkbf3SrcZQ5IS5dlgEWvWtPCD03fGY
 BlXBJ6PX9m97uf9vKIyR/T7TvHwiFfFV2AAAA
X-Change-ID: 20260713-usb_core_patches_1-84e2fb7b5bce
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783957473; l=715;
 i=griffin@kroah.com; s=20260706; h=from:subject:message-id;
 bh=vWUbaBwsplVgWupnIAu2K9+jTRYPRmZ8Z27CrYGM7Sw=;
 b=g2eaVFj0169boaW7KVNF5w32tpAETpUgQdtup+UOzR/TCjdR+qNdVK0ESgvhbaooxD4WXVo89
 5Gqok3+hOVrC48wrCcP65tqPaQYwalF54mroFbI3w8MXTu3dIYprXlV
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=Hy1TuVHERdQhLAWwjmxLFNtGj7eEEjaZWPXehAlic5M=

A small collection of USB patches to protect against broken usb
descriptors and a fix for a potential race condition in the hub driver.

Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
Griffin Kroah-Hartman (3):
      usb: core: Add size check to find_next_descriptor()
      usb: core: strengthen size check in usb_parse_interface()
      usb: core: Add lock to usb_wakeup_notification()

 drivers/usb/core/config.c | 4 +++-
 drivers/usb/core/hub.c    | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260713-usb_core_patches_1-84e2fb7b5bce

Best regards,
--  
Griffin Kroah-Hartman <griffin@kroah.com>

