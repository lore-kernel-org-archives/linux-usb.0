Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795803211;
	b=O6YFipGQxfMmCBkrTznl/WGnYmF6TBICv6r7qpRgQhnbLuqISTzV7x2lB1Bwt/fLS1p9
	 7UQTV6GHfCLvTZ4C8H5Smn2VsYy/FAyYVKRA3BgSj8n1UFc2BxaErRlQ9pk5PMVaOGW0h
	 WnJE6qXg8zpDNZvk0+218ZpP+jppWkFVeZsGMZDPjVv4wUtuSjqmcWCA83s6z5pa+QXeG
	 IjcpXTfz5FRuXBQFkcporbfrGpaYMC+OTQPaU47HggjF3kryLGgmf4QHwc5PmoSDIw3Oq
	 DPNtbDmB6mvU4m5IIsyJySEq1kZVellO3kpAqTisbfU9R+ckUugPtVML5dbmnelqn4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803211;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=pKHqteLIrnZjfZqFGH7gHhdIab+e6bJ0YUPAti3Krv0=;
	b=0CcBswdqGN9xNvuLIXPOpf/t3j9rjue+89haSw1Nusba7tpyPS4cGHPsRf1RbFMWSGUJ
	 4R1xFwrsJEFA9lL6st93fzALXTg4DZw//3socCzJheZlQqKQzh+mXA90CKZWk4vA7xMMO
	 nZsLUzw3i33OTFt3ASgwrUF0WCyQBy6XDDavpxHvXmy2GSl4QXOJBoR0ile7txu6nUp6Z
	 G/ogEws5wwmEqYBl0VdS1ODZ3/NvnXl9DDUh15VU2Ac/oKUZyvJHGLTFN3hAM3Lc8vjOX
	 NUaR0PFdHXT87KR5/Fg9HMciE1pGMy2gF1+ygOwB+zERbgTl5mFrhxRew+6D14Cp+bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=aloebbert@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=P7ARVSLZ;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEB7606A329
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 18:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EEB7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=aloebbert@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=P7ARVSLZ
DKIM2-Signature:  i=1; m=1; t=1795803208;
 mf=PGFsb2ViYmVydEBnbXguZGU+;
 rt=PGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:aTq/SAQnUAQgwTH8uau1TaNoaA0a
   IX3F42WIkO0iT7hIZURaCxh9H3bZWwnHv3H0owUImf/YEdqPHlcDabxRDJ8Cic7VEbKP1Ec3x7o
   zzZ7lGQoDvdsrcdtjijpttruVLIGzplGH+2/0+mCGiGF1WLh2CWrRJcxY4Aq0vfjW3rdkVv/38e
   KJUYysyv0HB3+WcHxpZEl/s1xQ9IlLIT8eGe4EdW6AOEJD7gMuP3L6r9QNgdQp+ZcYFLemSzqxa
   78dQ+gWj3ui5YYGyOWo6rMsumFextgXNFf78NAdnvMLNF3S9ri85N6/LSd0nvrHCEbof32Nlbho
   Y9pIFDeMaxbUUg==;
Message-Instance:  m=1;
 h=sha256:
   JSKh97J0w6aZv+LO935Qw6ayiqufOz8eQqIRzkwK31A=:
   pKHqteLIrnZjfZqFGH7gHhdIab+e6bJ0YUPAti3Krv0=,
  sha512:
   0CB2zFfmETTSi+i22OWQMU6u/jW3791nkphwdUY98E32jpwLzlBsWXTcuKnPcaUIYScuKE1KDIYL9Ye72cfLww==:
   58ngWpLonIJjcwO3ck1FqAve9mQeH6D4Z2+OjGs93+3ceOtGdvZOvdUfnZjxValdH+W3lmCdy6DFpkWxfFwELQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795803208; x=1796408008; i=aloebbert@gmx.de;
	bh=pKHqteLIrnZjfZqFGH7gHhdIab+e6bJ0YUPAti3Krv0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=P7ARVSLZh4lMX6p8C2o3s3DO4Xsw4SnfAY7QIP5jgC2Ivh7xTm4YaZLqVrxmRgWE
	 N5UJ0fGIPAmwRqETi1YWt2qizgIVsB/OZiKSkrTeY9lOj/9NBLbLsGAge5duZI72q
	 BgeWvTKhPOC0cDQuzZzvrg/i9s/EOwwT95ag3QlHZwxBztXLuj+gEmMBZFRoPEhPg
	 bYC5jwU4TR+SZuy8XQZehXBNcfBoBuHi8cnDu3RmDIqVd6cBX/P6GfC+wr7ffoWLo
	 hFKKekR+0DW6FFuc/isiqjArUlo2jJeU/6B0j4LbZhRyJ3H0R/9I0Vou72Z6b4TCr
	 0NaxSALnf3CJ3CiJ5g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdNY2-1y64DY0DDc-00oLlZ; Fri, 27
 Nov 2026 19:13:28 +0100
From: Achim =?UTF-8?B?TMO2YmJlcnQ=?= <aloebbert@gmx.de>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Mario Limonciello <superm1@kernel.org>
Subject:
 Re: [REGRESSION/BUG] thunderbolt: ASM4242 fails to restore DP tunnel after
 resume on Ryzen 8700G (7.4-rc4)
Date: Fri, 27 Nov 2026 19:13:26 +0100
Message-ID: <k7uRJRaAQqmUmtg0ECqwWg@gmx.de>
In-Reply-To: <20261127053524.GC953667@black.igk.intel.com>
References:
 <UCVQtIkrSxeOKGOgiChTpA@gmx.de> <bnvmvVhIQ2O8wiVp9S1lyw@gmx.de>
 <20261127053524.GC953667@black.igk.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Provags-ID: V03:K1:n2pSV6QSpcNnBWBDG/DpHTWQaPw4q8Oh2mGc81PQlZJhvjfQ1m4
 vuRTzn90kjqqXyqDF3wLHdbPHm2tE8JMWeeADs6DjmbUYVMub2yiPDcb2prZk/EtzqAjN5w
 Eq+RHiLxBdQ5owXnSY68E7mTZpKD9phnnOG9PdjGdMwH2q1p6nz+zBKIS+7PxFKn6fUjAHS
 38yybx/xRUpPYv1A+Ph5A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Yj4PCFX7jAE=;mWm7tyIjzTDSFq1YURGyuCkenhA
 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
 M/zR6qMP3AxKW+UcgJg0gSrDstlwWak=

On Friday, 27. November 2026 06:35:24 CET Mika Westerberg wrote:
> Hi,
>=20
> From the dmesg you shared, the DP tunnel is up an running (you can also =
see
> that from by running tbtunnels from [1]). Why the graphics driver is not
> showing anything is beyond me. Depending on userspace, you may need to
> enable the outputs via xrandr.
>=20
> [1] https://github.com/intel/tbtools

Hi Mika,
many thanks for the tbtools, which I were not aware of until now.
Just installed them and now I have a much more detailed view on my USB4 se=
tup=20
which should enable me to debug the issue locally. In case of success I wi=
ll=20
report back here.

BR, Achim



