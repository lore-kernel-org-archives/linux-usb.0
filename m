Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873569;
	b=To0Py43egisMjpCV4h601f31SbuzPmdQpr5IE1acbiH5nGYn+vW9xRzehHhKDDvzF9an
	 eAR4UpqEyAmWaUQVQ9MsPO8nXQbK6DAvqWSFJcxTpPu+av0tZGZepkdsA0MunBMLzVLZL
	 s1cddNkk6NMKV/r7eO2Z2WFeQ4vDFNs75wnMbsbq2GZOWMiiDKO9joKKtnDvdnkRDW3xX
	 cxckkvTvUB3KJOOA6P0q+6gs2zIA2TTKV08mtYiHB5VYbJUqOtBTek/HLwHT4V22juZOQ
	 5g22GnXJDfqDsGW6uDTw5vKppTCGjcAf4ZZ19qZLVqU0of+MA7o/ctEitbqkt2B1d0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873569;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uAIe0IZmGWPzIKYTvmGWwJg4d53LmxoMF8MC3vcn1kI=;
	b=b7R8VTViXaVWJ4wjX1SaAuxLa8FRSpLD4EenoaXMd4bo9zHYAQs2CEEcogtlnxVi5cqy
	 Y2IkrkSj3k/qDSPx5uSmO6UiHIA0b9ti6G7/yNKpQpBRA6ifjJKPDPeCd4GVtDI/+mzSP
	 DthqDTjSVG2TNhmZbOAduknO4EBqn+689jqvTvwAHiXRtUYeY5EpMyPjKPS4GFZ3VhNLZ
	 H8c3CmLHd9qKa+A2UGrcdEFWkY0mk3f1NYqqNJyOQMhcDBc5SjwkBR3arlHctAacRHCXK
	 fo3O26+WvCbi+7eQpUZkRkpkslXbURfnDOk77rT0ADmTG2W+BGxjrTuKz4cn9LKfKLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="TA/LhVwy";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA812606D835
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 10:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TA/LhVwy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9251F000C1;
	Thu,  5 Nov 2026 10:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793873568;
	bh=uAIe0IZmGWPzIKYTvmGWwJg4d53LmxoMF8MC3vcn1kI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TA/LhVwyp+j6rdp/o4dfDzZRH7Alzr64s0yYJ4B4ecgZw7d/tKvvHK7htofPPoQp5
	 ghMzvvElULfuoybaWPAlNY7bluhVJmmRbAOJGiYpr/iBT84zzcID4QPkWIZyyIXCKF
	 23BEqFCvhjGROerXpNZximq3q1sNHAiaxoPJo5P5LZDrXAmqLYPHBQqpHb5R0F56HU
	 5xTqS4HN1Qry0OJcXJge7Qf7kNPVHGVurXgCVjWX6XNR7elJ42XMApSwG6AObYNAHc
	 ULnxqxNMJVKHv/T2iuv6MJdOz0kPTdnD2yoPeBwTeZrUD+/PDPDvzjk+W+M4gMXRmW
	 +gINxnclQbKoQ==
Message-ID: <sashiko-outbox-198821@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: dwc3: Update nominal max votes for qcom usb
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akash Kumar" <akash.kumar@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
References: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 10:12:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Increase the nominal max USB memory bandwidth vote to let DDR scale
> higher within its nominal corner, fixing glitches seen during
> simultaneous USB audio use cases.
>=20
> USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
> MB/s, ~1.8x). This ICC vote does not by itself determine DDR
> frequency; the vote-to-frequency mapping is platform-specific and
> comes from each target's interconnect/OPP table. On the tested
> targets, the old vote kept DDR pinned at 1 GHz within the nominal
> corner, even though DDR can run at 1.5 GHz (+50%) within the same
> corner. At 1 GHz, glitches were observed during multiple concurrent
> USB audio use cases.
>=20
> Tested internally on RB3, RB4, RB8, Shikra, and other KLM targets.
> With the updated vote, DDR is allowed to run at the higher nominal
> frequency, and the following were measured (not merely projected):
>=20
> - USB memory throughput: 125 MB/s -> 145 MB/s (+16%)
> - RTD-USBC audio latency: 17.9 ms -> 16.6 ms (-7.3%)
>=20
> RTD-USBC is the round-trip audio latency measured over a USB-C audio
> path; lower is better. Note the +50% DDR frequency headroom does not
> map linearly to the +16% throughput gain, since throughput is also
> bounded by other factors along the USB/DDR path; the frequency
> increase is necessary but not sufficient to explain the full gain on
> its own.
>=20
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105100626.2003=
771-1-akash.kumar@oss.qualcomm.com?part=3D1

