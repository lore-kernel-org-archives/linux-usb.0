Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278865;
	b=zak/iAPxH6aIwlfj9aejjw+FQC9MLWQwU1/sNZO18C7us2G/TTHs3ZQpPSZ5QTA9FyLV
	 aSg4QG75f4FR0awkY/VA0pbb9uqs2D9HgFGwt+bo/ZWrNlB/Y7Z73Zx6qmO0PnxgBQay6
	 PFZKBl7MqePUAJHnI1sr8kQdm8WqhOSK/ahnZBEJhqp3ul/Qer/nSZw21j8RplwoEodJk
	 Q0f+wdDgGAcB9rS4oPjUgwAqLlHu3P66YGuNrHfAJdP7E4JPf77pehg3YKEIa8Ab+eQxp
	 Dtz8JJeEu+ZuAjBZk7VS0ctJJUHMBBuNIUmVMdqv0vHrDQfhxrnmp1EHJeNug/UOiTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278865;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cRFVotjwxyEnUFwAioisC41iSDmtFTz7CO2s4CRCYB8=;
	b=QxrJpKJYjj5oiUGn3zKQlHbZpnzh08aTJ+ZJd4+Y++p6Ll8oVxrCuf0OfUy/AaTNpza6
	 9kfnsmGL2Och/SrnmeixhGf7Z7FQS+8yiqSwVb4GCg2ZqJYWk4nzwlpGX4vtAvogVXuDz
	 Ke1O9k3X4z0Rrnw1JlX5mIJRDbKi3zO1RjMegvycAv2rw1sjBwBt1RNk/XShDqTsSkYtd
	 DkmcWxYbBwQjAGwHhTcwNvZPz3BL7CLZyaE56r0ohVh/LF0zn7VtX0YDS3RcM39SCPqR4
	 99Ycn2LgGow/01FKi38hNS4mIatdHX9FPPVEun33pywmdO0AD8a7gPBt6pWxPHiMrwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=koCifuVO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEA9606A31C;
	Tue, 10 Nov 2026 02:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=koCifuVO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5125D1F008A5;
	Tue, 10 Nov 2026 02:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794278865;
	bh=cRFVotjwxyEnUFwAioisC41iSDmtFTz7CO2s4CRCYB8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=koCifuVO5onqqUk8z+gfmINZzJYBgBU10DdvKfIu+onI80rrzRd7QtRnM1qyrck65
	 qZfPCpyYITeG1u5k+1e//Z0B6Lev7AS2IWfRQrhICntzwcQfgH5Si0Hu9h6aXSIPLE
	 pgezl8H/V7MnRkK4TnD/0d4muvQFCLy02fyvUG6+VzBM1Vjzkc1Vz6KNtvg3Qf8Sju
	 2ifiw9Au7qFKWFmmN0k4PnKv9bAi59DKCrMyTpHaqXzvs9NRTrhsKoPnDE1q84Z/jm
	 eQZp4milIoOfFzio2Od179Tinq1VrroMAKReM4vXXwNRcx+6AA4b4q6gUH+VEOKIP2
	 adHmzBwi0PjZw==
Message-ID: <sashiko-outbox-206067@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/4] usb: xhci: sideband: fix ring sg table for
 sub-page TRB segments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wesley Cheng" <wesley.cheng@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20261109-16k_offload_v1_b4-v6-1-858c6e0e007d@oss.qualcomm.com>
References: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
 <20261109-16k_offload_v1_b4-v6-1-858c6e0e007d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 02:47:44 +0000
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
- [Low] usb: xhci: sideband: missing Fixes trailer in
  xhci_ring_to_sgtable() fix
--

commit daeb30414f41a889c527fcde183d2b47baf749d5
Author: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

> usb: xhci: sideband: fix ring sg table for sub-page TRB segments
>
> xhci_ring_to_sgtable() populated its sg_table via dma_get_sgtable()
> per segment and sg_alloc_table_from_pages(), both of which only
> operate at whole PAGE_SIZE granularity. Since TRB_SEGMENT_SIZE (4096)
> can be smaller than PAGE_SIZE, these helpers describe a full page for
> each ring segment on larger-PAGE_SIZE kernels (16K/64K), and cannot
> correctly represent segments that share the same physical page.
>
> Build the sg_table directly instead: allocate one sg entry per ring
> segment with sg_alloc_table(), and fill each entry explicitly with
> sg_set_page() using the segment's own page, TRB_SEGMENT_SIZE as the
> length, and offset_in_page() for the exact intra-page offset. Walk the
> table with for_each_sg() so this also works for chained sg tables.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

[Severity: Low]
Since this fixes xhci_ring_to_sgtable() on kernels with PAGE_SIZE larger
than TRB_SEGMENT_SIZE, should it include a Fixes tag?

  Fixes: de66754e9f80 ("xhci: sideband: add initial api to register a secon=
dary interrupter entity")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-16k_offloa=
d_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com?part=3D1
