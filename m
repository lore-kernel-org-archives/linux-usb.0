Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595677;
	b=t1fywcYiY377YlRV4Z8ZZErp+YWi1LorCuhD3RL27rPrPnWoNccuJgZkXGmIagvGZABR
	 LMocd0A3qeDFhKqpeGxheJ9caQKNMkxFQvBC/P98Aohx3d0D+Jpi3MzdIAx/S8E5JXIZm
	 BufU1kvIyArRZjpO2ypWo1fwFU3AfPgPFLS7+N7UJxw3UnNe5K4pPH8idkNhqVoc2kxC3
	 I62w2Inus3jotQL8n2Q9VaKooJ3IjHgnQ75yOIRm/dQkRoTOGvUi8lN/ZKGgnkLM81s1J
	 tfrO3ntrHGkU2Im0mDOinxN2EIqeeraMyYDUHdxRr0L527yE58KWUMw+TLgmFZMlyBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595677;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+funsYoiUAwFhrLkT+yvhTf3MYgCT/7wDOftbqR0iCU=;
	b=eAiT4rM9zIUp+HpatBMvmNcdFbS3kGGtfTAPOCeGyQuYVu41iZOmevsY1hgDLXrqC4uG
	 Hd0y5KZNzqEOQBs4jQBrRd6fwsHFvE3tX9my92lga4e4GUy4tGYwLymrJl7dmzrA9924x
	 QD5JLW9hOOpkhn7IPKXsEojuL+dkQ/MWtf2x3IsCdeOXOuaVSsgshQOmbO5u1Rr0h/itx
	 f0yrf6n+/ctDUKXXMNOo1etMcuzkEOWo7RUJuSUGn45TGcj2NRI99ZvJ+vUfYD1TujljE
	 HolKXl7yfYyv0P4ByHG43AJjbxKutOENxlK5USX13FyUlW+ofKgxQUFQWaiZ0bLf1Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iGfgh/L+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581EF606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iGfgh/L+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4A21F000C1;
	Wed, 21 Oct 2026 15:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792595677;
	bh=+funsYoiUAwFhrLkT+yvhTf3MYgCT/7wDOftbqR0iCU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iGfgh/L+UiINp+tCqawrcog2EpRX9vUeTyzGwL+ilVbAAautQvwHy6hGFB9mPw4Gk
	 DuOuAn42dzqGoE7AX18BY+0A3tT+CYwKHsb4HVYmgQZnMzmkErB1XtjpVXAsYP39cq
	 JHi/BQB4U5KbzbTs8MWvgCr+L99EBDiDrMB58QpGEMak03DWQ3r2m83LTzZt/djrsw
	 ps2ZNNHLjplzPYnJkNVFylZP2vIO8yMQNx69iXOSx9L1X7YsGyr/6DIhpYUUaqSwUF
	 XheastDY0eVCAhp/4DKsYMZO2fU4qaqHTo/vjOCi6zWNYCvHy9S9NC2TrCPNd6w4CD
	 cZ0VnWvVwtNKw==
Message-ID: <sashiko-outbox-180424@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] usbip: vhci_hcd: clear URB_DMA_MAP_SG on all
 giveback paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raul E Rangel" <rrangel@chromium.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021150704.3129446-5-rrangel@chromium.org>
References: <20261021150704.3129446-1-rrangel@chromium.org>
 <20261021150704.3129446-5-rrangel@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 15:14:36 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> In vhci_send_cmd_submit(), URB_DMA_MAP_SG is set on urb->transfer_flags
> when urb->num_sgs is non-zero so that setup_cmd_submit_pdu() packs
> USBIP_URB_DMA_MAP_SG into the wire PDU, even though vhci_hcd never maps
> the scatterlist with dma_map_sg().
>=20
> Currently, only vhci_recv_ret_submit() clears URB_DMA_MAP_SG before
> calling usb_hcd_giveback_urb(). If an URB with scatter-gather entries
> is instead given back via vhci_recv_ret_unlink(),
> vhci_cleanup_unlink_list(), vhci_cleanup_priv_list(), or
> vhci_urb_dequeue(), __usb_hcd_giveback_urb() invokes
> usb_hcd_unmap_urb_for_dma(), which sees URB_DMA_MAP_SG and calls
> dma_unmap_sg() on an unmapped scatterlist.
>=20
> Move the URB_DMA_MAP_SG clearing from vhci_recv_ret_submit() into
> pickup_urb_and_free_priv() (covering vhci_recv_ret_submit(),
> vhci_recv_ret_unlink(), and vhci_cleanup_unlink_list()), and also clear
> URB_DMA_MAP_SG in vhci_urb_dequeue() and vhci_cleanup_priv_list() so all
> URB giveback paths clear the flag.
>=20
> Fixes: ea44d190764b ("usbip: Implement SG support to vhci-hcd and stub dr=
iver")
> Cc: stable@vger.kernel.org
> Assisted-by: Gemini
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021150704.3129=
446-1-rrangel@chromium.org?part=3D4

