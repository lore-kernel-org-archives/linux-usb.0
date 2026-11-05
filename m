Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793842875;
	b=xA4bqn0YscPXs/TWU/DJqEnJoAmS/BdgqMUvYdypsVsNr+rvnNvRCvdGKv4F4Je7K6mY
	 FOTSxYBgi2bL72vhAX3bGJORcW0GbyTfz/YlFS8Bp3911+HUkbjDrgRp52KCMlP6d7THn
	 P9x+aTgjTS3ceuzGNrWWWpJOF0NuaXnTSfDoSGTcJkO19HwIDBzMHMOolX+iigtnKHVHM
	 Crk6iOQq7O2Jr95FCZvt8y7rjv9KwgIA7fNZaUPbJmlL5o+6DSXbOjL5s8m3JoX7jSGSI
	 wZu/UELG3JNYlYTzE74sHNMPHWw4j48Mfb8rtiJoPddIPwoQXH5lCEVaoyi6yipzbTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=njZrUIUfNNisfYYtGhzfwCgxWz0ulUweBOI1MEVGWNs=;
	b=INa8Ev4WOKLfa370NZUwqIieTqXB5FtZ4AdK/mGZLhKyHvWLIpv1eC7RcTr3yEr72fXb
	 /FPcFM02SE0ka7iNeT3NIsS73PwWDQRjtYIEE7x+vD2cCepbi4ALTjWNl0oCkio509Vg3
	 4WCbiv3ThpE0StGtat2Cso/0pyYmtDkGNkXosNnKcFF5K7zS2TMONyeYmpgfblXcw9qrd
	 egh4FzLLQoOae9iClFkGc09wtQkNMb7QfuKVlIZqLNAKm++FwN9s5SKRBT5oMoSsG5nMM
	 b+rDk3TVY2/OkBOAhiZFtBj4scL0tJlKLRI5x1fjtGPUsrn/dRT8N33qp7tPl9DZwUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="y/qfmrh/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C866C606A31B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 01:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C866C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y/qfmrh/
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6dde81a6820so877645eaf.2
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 17:41:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793842873; cv=none;
        d=google.com; s=arc-20260327;
        b=L4qVZd1mc8UB/sHLqehKoJXYzAmm0i/hZHB5yWGNLBwjBSEuC+JqL1LBjzsGgiNkwb
         YGV3wYsU8E9x6zlm0elA05tYsWPckRxFy71BZvuFk39POiKBppA8dL+3L8s3eEpC6z5e
         IRtf3ZUoHGl7b6em6KVODQL6fXe7PDOj5Y6EVm8bjCZ5lHBBeWLZWL8og0L5FH+Bjrio
         nCIRUmZ66XGDbGbzWENKOywZpfMUX1GAE8Pwz3j7KVjpRRebdHS+yeunuWyKgzV0vErJ
         YsqsOwXDPbPfJMHp3gnq1LV+NWo1c4NaHPBPgiytJVRpMETrkY0d85fT/xpa33vdGFfh
         eUIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=njZrUIUfNNisfYYtGhzfwCgxWz0ulUweBOI1MEVGWNs=;
        fh=1xU7pQAQ5bwCAyK8cdPO19KOT7VJe6brFS6KIHTL6AQ=;
        b=eWhSNsrBgcqL8DBWDZza5UYA6rWjwafR78FiStQR0KcOGGIjyCH+WGAdVs10UTmunP
         rRGeTUKO+VsZEAeSghmJv5Wubn4WpF1nHLj7PQmQ0u/RN1LgrovrMxwzRQjR2BWMnr+g
         A70X/7ksLQDf3H8ipgX2iFgeAx1m2oNZEF3no7JCJ/ux6KRsSaPzF79uQPa20PpEiE/8
         P1DsV9RBvCWUma6O0iZtM5NUKcy9Py+wGdCNylaPDfmQVAWoBVIAA2PU4yXR+XGxd7QF
         hohFrxfqiOmqRJvZ6POyLJYIYof80dycn7hRL4Me0zqotWzq99lhvvIkeZiBudpzszpn
         4HSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793842873; x=1794447673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=njZrUIUfNNisfYYtGhzfwCgxWz0ulUweBOI1MEVGWNs=;
        b=y/qfmrh/Ik4iv/md3hrX34X9Ve19BGAFJINutxWFAW+A/XH4KZqk7pwEuhrriKSB1V
         uS7wjhJsgYChIaKDUE1vwr97lUI0qFs6iMpeXCxiwmqdHSAYpelZgIXe9xLcjryKevBE
         QAqdN9uV89j9i6r1tYlJBEI4yx+BdrQLHey4LWRQUnCmKhyicwQdBNvkMKw3HtJR+x55
         3sPfm1RsHZge45rlH1ucRwtY+MiDxSCUmgLNxuBFPBDkltqvsex77+XiRYXWVr3UO2S0
         Tk8GxGbB9Uu6vhfhW3xiA3S2mrESX0rlVe82VX8tC04TYPYOZG4IIPt5ObtXyuXdPEYZ
         SXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793842873; x=1794447673;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njZrUIUfNNisfYYtGhzfwCgxWz0ulUweBOI1MEVGWNs=;
        b=FzdjkS5MfrEse/G8VxBgO5Efbwd4Wgfeibzkugt4Qiq5TAbelrbR4D1SvhtsFcfdkO
         Nd5ZcnNDrRaMwLKs+dn5yv860zHmcRfU/1gy353I91zaKK2jBA04ziMAFhibwrKBCAF1
         F79wO3H6N7r1YTG56CJWYvNbYF1uNVr4+I6tWdZ+kkykKCasOwGe7OBsdGpd/6c+r++/
         eEhG1E6hkbHiqp+W8LSLYvgKieIVHEYz2BO9rAyBrad6/aUXYUfgirX0ktf6vg+0l3+e
         qBV1fe3nBacJDSHFkkaufZYS/9ZWp4uB1xDq5B8E1onp0S1HhhGQTSONStufdX5gSpAL
         R/Ig==
X-Forwarded-Encrypted: i=1; AKwUvBw3MhqMb0C9Wtw8iYpanUYAFO1ao/cJ49DZAZKhSzWt023RdC/6ocsVJDovzHRMsWW3LZ/trvSfXDk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hwevr4PbAcvOZ5l8+NQgnYGJxOVOWB+lO1setgIJfi7P/72XZ
	ZrmjZPzIMOHb2+tE9t/Sg1Fu8TiLMiBnIFXO9cYxENYPcO5NoYTi69I5Y6Gn3uoKr3ng10b+u25
	HBl2taqaa3TkwyXgUHg1rGvI97Rm0nbE=
X-Gm-Gg: AYBFou0eMm40rnMY7FEX235dVl9OevMlfxSLoTaHgqZyyzMqyTOCSDvl5GIDaLeA2CT
	QKDeZrE5/9PkXkdqpeZ5QsZf0Jz7oUweQOnWF2Ciso+bDwJOIq1bTMTP/EpqKblvQ2BIMkMe1li
	TcAbdna9FA8CYF67KnKKuXp7LczTr9LABRhc07CygfJr+cqcZuZGyD+4VTFvzYzqRCKSECWbzF9
	DdtzFyKDslUVLVGX4QlbY3hJgZeCH/Hey4Wtjgd2YPCGRpwI6wqorfrgXD+1hFU6rJ/OgXYGNH2
	6I9YeDNhTsM9ygFnyvy8Nd0BhMtaC3DdrTcHwVwzc2KQsgNtzu0s9YhZdp2ka5nqSKnmDqHCS0w
	0OS3zXKsTsKRUElSEefIDZOXLb3l7nx6tFFXzVtA=
X-Received: by 2002:a05:6820:c448:10b0:716:d78a:1008 with SMTP id
 006d021491bc7-716d78a18e0mr142291eaf.46.1793842873518; Wed, 04 Nov 2026
 17:41:13 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260914013033.3938-1-ki.chiang65@gmail.com> <20260914130907.749cd8e7.michal.pecio@gmail.com>
 <CAHN5xi0NSJO=V0=eVd4_MGp2Lg5NrwB3D+hsF87ehTSmaeeSbQ@mail.gmail.com>
 <0e4c85e8-77e6-4eb9-aca1-048199f2f0e0@linux.intel.com> <CAHN5xi0tN2iWGVfH18SASoP0HVvAaDY4Kgq2U6LCCznGg-1o9w@mail.gmail.com>
 <CAHN5xi1M+g3Sy8YkRKpZuU7EtTxiyi0ZD6y5TCcAZTrpxUpHNw@mail.gmail.com>
 <20261029060335.3ed1fbcf.michal.pecio@gmail.com> <CAHN5xi3NY2AUQK2=M80RYkx1N-bA8=zPEE6Y5400EYyMv1=aCg@mail.gmail.com>
 <20261103072849.623325cd.michal.pecio@gmail.com>
In-Reply-To: <20261103072849.623325cd.michal.pecio@gmail.com>
From: Kuangyi Chiang <ki.chiang65@gmail.com>
Date: Thu, 5 Nov 2026 09:41:01 +0800
X-Gm-Features: AclHuK-X5TrkaE1jKVeZptLlE4JZ_rQJuOYK8Xl6Sro29jHm0kSyqERVpVnitck
Message-ID: <CAHN5xi00SAMQf7q7NFgc8LjekiALKiy3LtmT6_SAGWaxZYi_Ew@mail.gmail.com>
Subject: Re: [PATCH] xhci: Fix HIK camera control timeout on Etron hosts
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, mathias.nyman@intel.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the explanation.

Michal Pecio <michal.pecio@gmail.com> =E6=96=BC 2026=E5=B9=B411=E6=9C=883=
=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:28=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Tue, 3 Nov 2026 09:01:50 +0800, Kuangyi Chiang wrote:
> > However, we captured USB traces using a protocol analyzer and
> > observed different behavior between the failing and successful
> > cases.
> >
> > In the failing case, the device ACKed the DATA stage but kept
> > NAKing the STATUS stage until the transfer timed out.
> >
> > In the successful case, the device initially NAKed the DATA stage,
> > then ACKed it, and the STATUS stage completed successfully.
> >
> > We haven't determined the root cause yet.
> >
> > In our tests, adding a 1 ms delay to both the UAC and UVC
> > control request paths prevented the timeouts.
>
> Could it be a device bug triggered by timing? Some xHCI controllers
> perform control transfers faster than others - we have seen anything
> (IIRC) from complete transfer in a microframe, through one stage per
> microframe, up to one stage per frame even for high-speed devices.
> We are not aware of any way to influence this, besides delaying URB
> submissions. I don't know how fast EHCI controllers are.

Hans de Goede also suggested that EHCI naturally spaces consecutive
control requests about 1 ms apart, while xHCI can issue them
back-to-back, and some older devices may need extra time between
control requests.

That could explain why a 1 ms delay helps in our tests, although we
have not confirmed the root cause yet.

For reference:
https://lore.kernel.org/linux-media/CAHN5xi1_T=3DC1v=3DhDqoHxLtc9uuZO5Evsv2=
hS2-ZSGd3_mo=3DqSA@mail.gmail.com/T/#m99c67eb54d5b60bad94d2643f4c28068e1653=
894

>
> > > > So far, we have reproduced the issue with these xHCI hosts:
> > > >
> > > > ASMedia ASM1142 (1b21:1242)
> > > > Etron EJ168 (1b6f:7023)
> > > > Etron EJ188 (1b6f:7052)
> > > > Intel xHCI (8086:8d31)
> > >
> > > I don't know that Intel chip, but the others are quite buggy.
> > >
> > > Have you tried other HCs? Any successes?
> > > IME, chips from NEC, Fresco, Renesas are more reliable.
> >
> > In our recent tests without the delay patches, we did not
> > observe any timeouts on the following HCs:
> >
> > AMD EHCI (1002:4396)
> > AMD xHCI (1022:149c)
> > ASMedia ASM1042A (1b21:1142)
> > NEC xHCI (1033:0194)
>
> ASM1042A surprises me, because ASMedia in general are among the fastest
> ones, except AMD Promontory chipsets which are extremely slow. NEC was
> slightly slower than the fastest chips IIRC. I'm not familiar with AMD
> Matisse and have no idea what xHCI IP they put inside.
>
> Purely out of curiosity, could you connect a USB 3.0 NIC like RTL8153
> or AX88197 to Matisse and see if it breaks after a minute of:
>
>   while :; do ifconfig <xxx> up ; ifconfig <xxx> down ; echo -n . ; done
>
> I found this to be a 100% reliable way to detect ASMedia controllers,
> including those in AMD Promontory chipsets. This is the periodic unlink
> bug I mentioned, which is mostly mitigated by 7c0c31c66a7f9 in 7.3,
> so the test is more effective on 7.2.

Unfortunately, we don't have either of those USB 3.0 network adapters
available for testing.

Regards,
Kuangyi
