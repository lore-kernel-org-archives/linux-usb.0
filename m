Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005997;
	b=S/MueXxTGv+Djf+mJMDzzZI3bXtG/udyGXNPmhby56XDlaewarGrXurnCJmpez9DLaoI
	 5KKqGMnzzXVZlYW1jtpbWUDdhd1E+ap9Ka4Xfv0c6lp4uFr+W6zWhmYspaC0LscG4rH8n
	 NlGEE/eJnjt2eflQVaYL19F1kGC8mGI9/5fC5//XJaknxWqfoemwe4A6sxqPlLS9cR8+e
	 BblcyzA+r5Sh0Z4tpB0jyBJZ/ByaguLxhbPoZ84DPd3gAlDasmqTVP1Q5LhuEx0qgH9Ds
	 kNRyU37xCrDULFWeEXMFRQCQVLphG6XiciXQejGOl863DnbwazUV5RVvidkBE405p6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005997;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gkRyiRQ49Aljc0YqkNVe/vHbA2ZMDkSJLCY1WGNEVWY=;
	b=klRouMSAxnyzpXe+q2EWNDeecNhtIseTYFI/DutoY3xq3N0mtLKaM07FakQm3AMFarol
	 WN86KC8g39oXagsZPPr7QoTEfqwHTWOB/rG8RVRoJYAz6uxyEnnC5wnl9D8WVFxjH03Ve
	 9rbUC2y1Hl5Yq9MrlbwYfems4LwZa8b8erNT0X4Tsa6sBDugq+iRpN3MjJlkaoDOXRf09
	 EFhayMS6CF6CQhhRLOliTwUJVBc7IfQYNBMf1yuXBMfFThnuUBFjAvHls1cVVBNv9Tslf
	 UnTSSJR5h6FihZCMSwUBlPiXeZ/VE++OnXOEr3RhbRUi7uuS/HDkiAUsSF6fT8h+n1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KjDL46zd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7A8606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 12:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KjDL46zd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0071F000C4;
	Wed, 18 Nov 2026 12:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795005997;
	bh=gkRyiRQ49Aljc0YqkNVe/vHbA2ZMDkSJLCY1WGNEVWY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=KjDL46zd/nU63/xS/5/e1K3KucTdljO0ekxlkCpZT3XSBfStaDGBdFI69oG2Ym1kN
	 n63ZsHxxiAZoWdfki/roSe04zESBI8BSpYTOmEMK8pTgkTOcRiHgGmindYjL0DGZVl
	 pVYiYm++CIKXquH+aaQAEjQX5O9sZUg7bisL+cIwQoxpnYIbPEp76gIeo4t/iCCCgx
	 fenZdYFKbGfE/jB5/iB4PtlFoQIPgbb4lpY4h+Fw0nPCKVK2UDsBwImDp4CU8dzkK0
	 BmP5rSMMBqKhgt8hoSDggKy/Jfqodin6dIWqHey//irDr48Cfu0enrTGwkQg/dFAYP
	 mponhQWzrtelg==
Message-ID: <sashiko-outbox-220938@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/4] usb: gadget: f_tcm: clear the scatter list when
 reusing the BOT status request
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yehyeong Lee" <yhlee@isslab.korea.ac.kr>, linux-usb@vger.kernel.org
In-Reply-To: <20261118124005.2428068-5-yhlee@isslab.korea.ac.kr>
References: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
 <20261118124005.2428068-5-yhlee@isslab.korea.ac.kr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 12:46:36 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> bot_send_bad_status() reuses fu->bot_req_in/bot_req_out to send the CSW or
> drain the data phase, but a preceding sg command left req->sg and
> req->num_sgs pointing at that command's t_data_sg - set in
> bot_send_read_response() for a read, or usbg_prepare_w_request() for a
> write.  That command is freed before the status request runs, so on an
> sg-capable UDC the status request is handed to the controller with a freed
> scatter list: the controller reads freed memory out to the host on an IN
> endpoint, or writes host data into it on an OUT endpoint.
>=20
> Clear req->num_sgs and req->sg so the UDC uses the linear req->buf instea=
d.
>=20
> A test module that stands in for the controller's queue path, so that it
> dereferences req->sg the way an sg-capable UDC would, reports a KASAN
> slab-use-after-free on the freed entry for a read command followed by a
> rejected command that reuses bot_req_in: 20 runs out of 20 without this
> patch and 0 out of 20 with it.  A normal sg read still queues its own
> scatter list.
>=20
> Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP=
 + BOT")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118124005.2428=
068-1-yhlee@isslab.korea.ac.kr?part=3D4

