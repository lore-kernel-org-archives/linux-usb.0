Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D1C47799B;
	Tue, 21 Jul 2026 10:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628933; cv=none; b=dKPM/IVlxaDbetJxRSTRyPUvnOgSRyxoh3sJnm7XrOmDwLHqmFo53VNQTy1G3pOUtERNA27uhfcZrwHmjfX6eAa0o/IqPUdXhPUQpW/jpX6kyOy5Q5gUJBoyeYqvK40jjUuUXGnuZRG1Qz1E0vmPNpu8vZJ6wHwtkYuVL+ix8IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628933; c=relaxed/simple;
	bh=1kPO/GPf29u/NuhCgszGPT8mMvgxLY8Hpi3jUc1XFhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JSH2a3mQUn0rBqL4jA73pV3nLxCdg3Yadc+EyIW1DqjrHjlSjDGYebxyQ0ydu9H6ULVqkkIS2oADPIGaVF4f+QDQxdizMWoqjiH3s8WKnBbXZtQWv5kt8ByaBOOQsGmTW6uFLBzOLCyv+X+otc2TtyjgEsjQHHQREbCvCnU2NTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=S7lmZBN7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BlkNWvAc; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="S7lmZBN7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BlkNWvAc"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 29C3C14000F9;
	Tue, 21 Jul 2026 06:15:31 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 21 Jul 2026 06:15:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784628931;
	 x=1784715331; bh=1SM9ERf3Ou4euc/IZA/Lh8bglub/h0513VewMib00lE=; b=
	S7lmZBN7OsShufE31UFFkj/L8G6LoxjM5R9FKZc11i/NYTacYQN2AlJF46kcJmPE
	KgYL+l7Z/gXY6L1nmjB5P3lknfiKoRKXyhPc+qNus7wewIQNnhy4GarpJ/8TixCH
	YEaHiod2mLOVicS3xOwsxGjHZllw0USKOuhhDqpTrM3TnFcgzj9tZZW2hM6v24Wc
	7J9hFSg2DoohuSUfR7Do7k2zhWyS7odn3SYbpwdfpapLMnEvDIIEi0FqGdu+axe8
	MlkNr4pyxAJSPAu6Zmvaypc25bKwTePHyJNOJw8ELUy4Gm2fzCKDA5zVnwmb8nkB
	g8JYhMolErLvYmtDK13cnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784628931; x=
	1784715331; bh=1SM9ERf3Ou4euc/IZA/Lh8bglub/h0513VewMib00lE=; b=B
	lkNWvAcFAfSWua4urPUVzbTw2EWOK8++btb1LX2gUEYNfXzK0otgdwLa85gliNNo
	A7Xgh493xX5z09VuLWkok64KD8LCwmdMwS8mVYJ6WYVOZEySOCordy8/CT7F9iDD
	2/0XYlh4hfAv1eb+6nfYqPXByxcUuIYQb2A9qz84WeBIZo8OqzVcab4HXmH/UtKR
	AlxjaUcgnjt0lunyV5cPF5ttDwR23fGsoroEhYyY1FNn0KdZ3jRC0iovARjHFlXu
	W3gAjzKgOJhBY5t9LncPjjraa/m2A0Kip6unSW4wHIk7tGmHUNdzkVx/VlBqkVxW
	YA6KEyuIEWf/mifkmz+UA==
X-ME-Sender: <xms:w0ZfajmGrgY-9_R7YtFfUn2Ig_A_isF_yoMyy-9crhJ62FFJZb1olA>
    <xme:w0Zfakpqkqgij4vgx87lw_H5FMYmLG6Mflznbv4rb4FuEeywQVmy-5zsQbxnlfyxB
    r47WkFJC9b-VTJRFia01t7LlwQ81X7yJD2o1UKz-01oRoVW-_I>
X-ME-Received: <xmr:w0ZfakHzTidZ-OtFiKf1lZTvE6nNi_du_ZixQRosSspCSpAPBxsvVsHjM5PHZ2TejxygXs8XAnusn4-ZipojrY1F7MmcYVfPdg>
X-ME-Proxy-Cause: dmFkZTGQoSWIwFv69WXV+ftI2/mjOFtCsNDz+AANztw64sSx9wc1Ga8MoHJsRFgekzrFb8
    mKZY3NxQ7M0H/FoH5h0HNUV9+C//gA0qFo0yWibfAWw2mnxaAjuqJjye/MKThYa8E3ZSTV
    JOUncBAeFzA1ujSn5kI2E8E7FdYrbS8hQjJ6F8uwO7s2fVsY8AxAcULfVynMrPbsK+SIpi
    oCrgIRizuTShwmfvp/emkQQo/V5cydhua1IaNuyd1ySxmYbtwq//pQqADjtHSOIQ6t7g+Q
    lrq+bPglTaJHi84KRQ8O8JlfI7j/aKxwgccgR3dWiaIWSFzy+jNXSlsjDiljV89QsiS0Z3
    UAx0SlY9/RHXkybsXL0gA0BKNm3ZdbGWWz6UUdHZodGnwH4Sad5g1a2QV70o2gvrOO4S0T
    cypggsVIC47FZztB2GqRTWUuos7Gi+hawcx0jMCcrmA4BO6nUt+6nIcFSpPkqOgzt8YVWw
    NEs95Exa9bXiBSi1XDSANQZGhOxjPxC98QW64C2UR2owyZRBFs5/Jh/fWHBGhdj4c5IDVR
    brGvHdNIFI7FXuNkVntqvsCDsT/iQ2kUSCMuC/VD/GVa3c1hoknGiA41/3f0xIJzTkvKlP
    aEuJ8g67X4R19nUQPN+0bJWDBulzLA4vB2WeG77sHc9IJxRTBIRaV3bZwvcg
X-ME-Proxy: <xmx:w0ZfaoxGrJcB8PPNHgig5g3ElEvWvn-LVMZGdCsl6pWJ7LfNrCJ61g>
    <xmx:w0ZfahrltlTuGcnXDECTxrAnd7rAGsbcwg3NP1sucWx7fdwL9K8ATg>
    <xmx:w0ZfaqjO2T6M8HHMivL7_FvyCA_VchGUFswmJlnO4vNUm1clg6MVng>
    <xmx:w0ZfamiAWkhFhNku4at3liW_flYakBs33ON-rwmpULdoBHQFVpkCYA>
    <xmx:w0Zfaii3Sv-XY7y-C0hW1a6D6KBHDvFNOarlpmjJHVWYAirR-SiLCU5C>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jul 2026 06:15:30 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
Date: Tue, 21 Jul 2026 12:15:19 +0200
Subject: [PATCH v2 1/2] usb: core: Strengthen error handling in
 hub_hub_status()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-usb_core_patches_2-v2-1-05069c892fbf@kroah.com>
References: <20260721-usb_core_patches_2-v2-0-05069c892fbf@kroah.com>
In-Reply-To: <20260721-usb_core_patches_2-v2-0-05069c892fbf@kroah.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784628928; l=1283;
 i=griffin@kroah.com; s=20260706; h=from:subject:message-id;
 bh=1kPO/GPf29u/NuhCgszGPT8mMvgxLY8Hpi3jUc1XFhM=;
 b=VC4bytRhI9CJkS1c09XJq70MgC+Jqv2XEOFUyGPW9nyWxUSeo9C7NBJ7s6NQ5tBCe973SSt0X
 XmAOomrTEaKDjTrE2jGU8V8W8HVF8DcJS9r5imhoJbdYrg9LyGwupP0
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=Hy1TuVHERdQhLAWwjmxLFNtGj7eEEjaZWPXehAlic5M=

Add additional error handling after the call to get_hub_status() in
hub_hub_status().

get_hub_status() uses usb_control_msg() which does not verify that the
message is the correct length, substituting it for
usb_control_msg_recv() would also solve this issue but increase memory
allocations.

Instead, error handling is copied from the method used in
hub_ext_port_status(), which shares the same flow of logic as
hub_hub_status().

Assisted-by: gkh_clanker_t1000
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
 drivers/usb/core/hub.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 5262e11c12cd..0d2166b8923a 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -991,10 +991,12 @@ static int hub_hub_status(struct usb_hub *hub,
 
 	mutex_lock(&hub->status_mutex);
 	ret = get_hub_status(hub->hdev, &hub->status->hub);
-	if (ret < 0) {
+	if (ret < sizeof(hub->status->hub)) {
 		if (ret != -ENODEV)
 			dev_err(hub->intfdev,
 				"%s failed (err = %d)\n", __func__, ret);
+		if (ret >= 0)
+			ret = -EIO;
 	} else {
 		*status = le16_to_cpu(hub->status->hub.wHubStatus);
 		*change = le16_to_cpu(hub->status->hub.wHubChange);

-- 
2.55.0

