Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793115470;
	b=IPItYAsSD/x7c5dlBwIHWNgLFLyezlGEAWh8a99f+UbMhwYRFW/sMm036hfZmtIBeyTN
	 HmtYlzHHP8o/2DEWYhCD52m+3Pjfa12ZE8YVRTz/RnfYlns34MRBTsJ4vkiGaDcWu20RX
	 qPcnwZnYSZoS2bU5CKry9eNy/4A4FNkeENUJ7K12dOF76m8rNwP+YMZY5fZACPKwFduTs
	 yZ8l5FE8urdUYHI4yDkC9DAtyEe0qIOZC8P+URYzc2iKuFGhkharcHARn79WppS1bKkZ3
	 va3lakaiKG/TqwdRikuFl84h9gfvx8E8uPS6JT9g9Hzd98h5BUU81gtOqQvCqSM2mUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115470;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eZXAYZNfo3bST92SMFh592Lg12aGzXtCz8BgZBTyYis=;
	b=tqpgxyXF+u8zcDVlbaxMVcNmS05JKzW4U3/B0V7eqme1v+hrqlmD4o2qQnGdc+kvQEsr
	 d9Ju6Wv5na6aiZwD2VmGf2R63zTCujGTWWAfwMgQ9NypPq0J79OErBGMXI6iV5F5laz7I
	 CVszWCEIVhtOe1NoEYevKIar8yLDnnEO3aKf9/97NlPw9FAjNOP9zePuTEiKs2hexsyMV
	 QUDzqo+ZIK6UkV3fvvx30oM5NYjXaR1M9arQmtzpKxVaHPXxaCsRcF4W9/AwcyKMMz+c4
	 hsjOkbFJTXm22O8mDBUE19VS3VALkHZum+/oEO3UIBWfvGjp1Ll5CGuI9teQPr7TzAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="MS/9OdNh";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086CE606A326
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MS/9OdNh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6378E1F011C2;
	Tue, 27 Oct 2026 15:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793115469;
	bh=eZXAYZNfo3bST92SMFh592Lg12aGzXtCz8BgZBTyYis=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=MS/9OdNhhghWWKAqaetjJGmHL6vg40WovOCtS4gYFvfgUWNx1NaPyNtQnjl/y7/nt
	 wij2RgVwU3YRK2+/slUv7ypt2DCtCo3Kdr+9nMBXceUNJM0Zc/GSDfs2C5EQcxusx2
	 Fz5/OXBr7HrHErYs5RjxObE1nZcU7ttfG3tEzcDFFOXlWGx1kGMrS3zTPwYrnSJtIu
	 jGq/fRmuoqER/IsTvVorpv28DE7ez0+SOHDnkUpeAHkYjAhjvMz8RTBpXFRZZdqxNI
	 Lsi/PJOckF3XX9o5p28T8LxaOeUnvkq5aQ9fZsfCoGkoiLwOzpDfd6J5mxBY4OavOM
	 +oOYMSH4akyOw==
Message-ID: <sashiko-outbox-186848@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 19/19] usb: dwc2: wait for the TT clear in
 endpoint_disable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-v1-19-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-19-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:37:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Josef Bacik <josef@toxicpanda.com>
>=20
> When a split transaction fails, dwc2_hc_handle_tt_clear() sets
> qh->tt_buffer_dirty and calls usb_hub_clear_tt_buffer(). The hub driver
> stores urb->ep in its list and hub_tt_work() hands it back to
> _dwc2_hcd_clear_tt_buffer_complete() after the CLEAR_TT_BUFFER request to
> the hub, which can take up to a second if the hub does not answer.
>=20
> Nothing keeps the endpoint until then. dwc2_hcd_endpoint_disable() only
> waits for the QTD list to drain and frees the QH. If the full or low
> speed device is unplugged, usb_disconnect() goes on to free the
> usb_device and its configurations, which hold the struct
> usb_host_endpoint. The callback then reads ep->hcpriv from freed memory
> and, if it is not NULL, clears a bit in whatever it points to. A change
> of the configuration or altsetting only frees the QH, under a callback
> [ ... ]
> Fixes: 7359d482eb4d ("staging: HCD files for the DWC2 driver")
> Cc: stable <stable@kernel.org>
> Cc: Minas Harutyunyan <hminas@synopsys.com>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-v1=
-0-b9751ddb9c7c@linuxfoundation.org?part=3D19

