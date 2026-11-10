Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279748;
	b=YiSjJ2rr305Hnmv3ftiwo9/r8i6R258QReHMb1nmhCf7WCOD5d5Cbd27AEnucqc6z8wv
	 KVZMPQB//Ob9KQFxl1f4NFNhSkoHhhh0vAatYOifPtBl1WAjHqVbtACJupieSGwzH0aVu
	 iwqEDwt/jVO/4fkO/Rh27v8ywo11EdlI+ww4TzNLc8ytTXMw3apJjRnqvpyBUceJBwd3f
	 Igq2NH0jCLziL5fm353QbzWtz44B+RPRBt6MZrUl7nhv1io8YXGfqqnp3fn245lycYNNZ
	 pVtEbVnXBibi6hUHVcUJjNE/f66Cy7lkkJQlmj009Hub2PItw30pxqqPE6RBSn34QEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279748;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+Q2yFQ0jpFHT210w7KITsvkNPZAi5rAPLGOmObO+h/s=;
	b=3nXc2jPR1NJINapvHgZQzkHibconucN3XIkCUSZ6xXNLc7uP4+EmHMZY5I2X5BA4vYuI
	 q5guSHSvUz6ARYEAE2niuz4qlkMabGubIOUmsYSAWWAELYldF/eYdE4YDfpIOVe7sARXt
	 GmHCvjv1vkQUEeKwKilP+4wGkGBmsZjt00KIPCkega2eVKiOmAqL6GYajq3rqHHFfjYnI
	 psCZeu7TDnWALOi0qtVrkVnewhi7rQPiHaf4ojmyf8mwBEkwOHF21v0VYgAnaODDDkbWb
	 3amY0OFNGF1p8PHtBzFwjSZl9CP1REQrvgZdX1e1cBEYiAA5k84XOOhCQ8AbMkkcSdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LHw0Mk3P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47C6606A33A;
	Tue, 10 Nov 2026 03:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LHw0Mk3P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1262D1F008A6;
	Tue, 10 Nov 2026 03:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794279747;
	bh=+Q2yFQ0jpFHT210w7KITsvkNPZAi5rAPLGOmObO+h/s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LHw0Mk3Pi1it4YrDz/Qk/jH9FnJGuRo72hI50PJYyipg/0abMBzKsUwAehZwXOoV6
	 ZxDUWSK/zvnJYq0ydAj37djcr+F2/3BWvq3TKg7cvAQEofQ5uyqjtOyHWXnQsT7xPp
	 FdM0zQazzcI5qaoaBn59TKeGTq6DnsctM9/igwxhhdflM3Ly7h6DCMYDXfkNmaaR4r
	 TjHweheLre54rIjZ2mGIzBPQq+KPNERidh0g/UYyYzZ/WZNNTrr6lf9zz+53tZ6QIP
	 2NsqCQyTekZ2BFEHuDg0LeBsYonq4wadxpSe/aSjSqnF65VQ1qjT344eMsIcngYlj7
	 F77m2OG0rKSjQ==
Message-ID: <sashiko-outbox-206090@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/4] ALSA: usb-audio: qcom: fix xfer ring IOMMU unmap
 on 16K+ page kernels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wesley Cheng" <wesley.cheng@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20261109-16k_offload_v1_b4-v6-4-858c6e0e007d@oss.qualcomm.com>
References: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
 <20261109-16k_offload_v1_b4-v6-4-858c6e0e007d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 03:02:26 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ALSA: usb-audio: qcom: missing Fixes trailer for 16K+ page ring
  fix
--

commit 7088c3c3566e5837438b6b83c5b7547812406f63
Author: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

> ALSA: usb-audio: qcom: fix xfer ring IOMMU unmap on 16K+ page kernels
>
> TRB_SEGMENT_SIZE is hardcoded to 4096 bytes, but on kernels built with
> a larger PAGE_SIZE (e.g. 16K or 64K page arches) the IOMMU still maps
> and unmaps in units of PAGE_SIZE. The driver maps the page containing
> the ring segment, but reports the start of that page as the ring
> address and PAGE_SIZE as its size. This is only correct if the segment
> starts at offset 0 in its page.
>
> For both the transfer rings and the event ring, add that offset to the
> mapped iova before sending it to the ADSP over QMI, so the reported
> address points at the start of the segment rather than the start of
> its page. Also report the sg entry length (TRB_SEGMENT_SIZE) instead of
> PAGE_SIZE as the ring size. The offset is taken from the sg entry
> rather than from the ring's DMA address, because when xHCI is behind an
> IOMMU that address is an IOVA, and its low bits need not match the
> offset within the page.
>
> With the offset added, IOVA_MASK() on the reported iova no longer gives
> the page-aligned iova that was mapped. Have uaudio_endpoint_setup() pass
> back the mapped iova, and use it for the cached data/sync_xfer_ring_va
> and the drop_sync_ep/drop_data_ep unmaps.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

[Severity: Low]
Since this fixes a bug in the transfer and event ring IOVA setup and
unmapping, should it include a Fixes tag?

  Fixes: 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND offload=
ing support")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-16k_offloa=
d_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com?part=3D4
