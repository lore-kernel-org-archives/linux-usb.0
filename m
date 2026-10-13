Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AC6378823
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 08:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880166; cv=none; b=XFTB21WxfPW+b4z8fPx5a//JM7WbpkwwOTNvxly5xxCXC3uRejlYs/icCGu4QayvZr1MBgAn0Piq41ue8PvPJviEM1RpMg1oaMkPpuL5Eqg9APx+dNQciCYLDYaTzO4LiklpriAMpshezsdlug92HCnINn3EgfqD5QUgtiHrA3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880166; c=relaxed/simple;
	bh=yP7wi5n0+0H+1TpJPEO4fHXuoxmrcUMz9vII8pBbKVc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=pyheMa86P77peMOQTXNsMwxqOJAAktLyjewaUdpnbb1unQoXGWPu2N04EY0TUvq4QEBLpcLABUkpEtPfGNWWtrisx8N9tCIcVrBYSeXFdy+WmTn35H91wJRH8zQ5Ankx6EXtU95cTawNnrnUX6S1T3eE/TDUPLApMl6FWqLr6EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqjGnUjS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqjGnUjS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578891F000FF;
	Tue, 13 Oct 2026 08:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791880164;
	bh=XIxZMxCV9UrCyGDlia/50R/wt7InzQCyna/FhUuL1og=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XqjGnUjSaBww9goUlp3eFlD7HUzsZ/HF67nnUnw9DKIcWxD7LUvJpfiI8z4Ena32D
	 /77xmIJmDqsuNZ0+8erRF/M+bJJ/zwAFq+8VxwcJixyFCQGJanDMeKgPfeUV2Nr5ni
	 I09omdQ2IW4nyKsFe77cpxWKYqVUCJ4QlRQi3wmDr6xFUFBi/KsVgfZj3OMgdk9ReN
	 HVmfBK5jPLk3uXesWlakn1S5F5BkHjHC12Gop7i1cTaOO+uR5PbrzjAaHTc2AnBeDt
	 8nYfCkGS3MJYCd1oDWCZbHL7jHMmPC8q1hf9+hqmfRswonaih7estChw9uSP72tzWw
	 tkM7Oqf5D5RnA==
Message-ID: <sashiko-outbox-169253@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] usb: typec: tcpm: Fix out-of-bounds read of the pds
 and pd_list arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Tso" <kyletso@google.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261013081549.2375441-1-kyletso@google.com>
References: <20261013081549.2375441-1-kyletso@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 08:29:23 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> select_usb_power_delivery_show() iterates through port->pds (via the
> pd_get() callback) and tcpm_find_pd_data() iterates through
> port->pd_list until they find a NULL entry. However, tcpm_fw_get_caps()
> allocates only port->pd_count entries for each array, and
> tcpm_port_register_pd() fills all of them. Without a NULL terminator,
> both loops read and dereference one entry past the end:
>=20
>   Unable to handle kernel paging request at virtual address
>   adacafaea9a8ac1a
>   Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>   pc : select_usb_power_delivery_show+0xa4/0x110
>   lr : select_usb_power_delivery_show+0x90/0x110
>   Call trace:
>    select_usb_power_delivery_show+0xa4/0x110
>    dev_attr_show+0x38/0x74
> [ ... ]
>=20
> Fixes: cd099cde4ed2 ("usb: typec: tcpm: Support multiple capabilities")
> Cc: stable@vger.kernel.org
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> Signed-off-by: Kyle Tso <kyletso@google.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013081549.2375=
441-1-kyletso@google.com?part=3D1

