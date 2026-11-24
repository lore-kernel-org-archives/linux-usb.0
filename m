Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511203;
	b=SLnXt0AvJjMqTztjXPcvhVbSk5abUV/85jboAR7diMlFbwyTHcE2dOBkFurnUT1mRyTJ
	 dwbymupv7mYl9kkdte6zRnXbmXsZLdRYptW2chd/nkSsJJYs7jZZz2GTvtjL0la6o+tty
	 97T3/oxWn1DFVnEw5gG2cGsBBV/mBqRVVdktM1ioPuoEV1D/onuS/PDy1LLS9YHLkHYMP
	 jLc8TLK9WySRVkJ8BQ5cqRgMANIpdIs4S9U0cI6PvSGeWO3us9QCDbqmWeHGQlAiNl6d1
	 HLb4Ba8gy01BvOsQpjYa+TcKezgp/pKIx8dTgAEsG0uCdtOtBwRlxhKwTxutQgD63Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511203;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vLnWNlTeMMmUmyjAJpFJ27idYEmoEgz71muzyQrxngk=;
	b=XXm++E7veTdqXc1PHytoN4ioe6SNSzEMEs/e1icyr2Sx6eYw40bP56aA48eo8KChjSjw
	 97LXBl/W4Xo6w11ch/BIXocxhA0odEcc9i7iL43FTYeJ3msDV24yTQxnIxo9eRuGinTCX
	 Al9/vll+GVNacywd6SjI7BfFA9nrATXhpjeWHr4wdQHwIl3RT6InkySg9ES03bUfnrxjl
	 jgLh54UcClS4O8bURYZra0yaipFp+cYbSYIrtZUwZg9sUQAb9QxNRuYn/1pirlP8t+AXq
	 hkcUcJsoZTqSgMmPmoXRoYzQx9BFTSJXyXs6M2PRKpHecocQba77mOUqkF+X40iURvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TTwiV9sk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F322606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TTwiV9sk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CAE1F000D0;
	Tue, 24 Nov 2026 09:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795511203;
	bh=vLnWNlTeMMmUmyjAJpFJ27idYEmoEgz71muzyQrxngk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TTwiV9skQyKic9A/VAiih6YyaaH2REY31a8iPl84DhsAuJn0idi6chufhcMPsBNu1
	 W47j5v+ljKGVOYOcvpik+02h5TOzXZZ0aV4mPDiia1iErsXWHBPKbkdUWcFCsoZ6ft
	 ZwSaqdPbaKkwe3uFqo5WFn5TRNHC/uyNRnhmmEKBfvudsuEE2mntJbmXSVeLJn2A04
	 hIIiNAUc9GZHKJmU7PPRlVtiW635b+8UZK/s+QazSwj25ToajWB+0v3zxxXp3w/IzH
	 /3xl/rbEMnhxMKdnaEwKoWdlRH1lGJFmqd3xr1Z1VSN4Tgn1rlaMKGcLmnhwvWfHXI
	 sryJFQNsRmTKQ==
Message-ID: <sashiko-outbox-230788@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 0/4] usb: typec: ucsi_ccg: Add cypd6129/cypd6229
 support and CC orientation sensing via GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akash Kumar" <akash.kumar@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
References: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 09:06:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 4-patch series:

- Patches 2 and 3: no issues found.
- Patch 1 ("dt-bindings: usb: cypress,cypd4226: Add cypd6129/cyp..."): 1
  potential issue (1 Medium)
- Patch 4 ("usb: typec: ucsi_ccg: Add CC orientation sensing via..."): 1
  potential issue (1 Medium)

Detailed reviews have been sent as separate replies to patches 1 and 4.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-ucsi-ccg-c=
c-orientation-v3-0-73cd114e5393@oss.qualcomm.com
