Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793091126;
	b=dhyaYE3bHe4+N0lbaDfkQzNRH7U9qHba2sStNKG2M9tTb+MmNm8aJHYT41RMip7xeK9W
	 snHz8B+vo1PgnvuiAen+ePeqCnaU47LQlT/WvmAbApRXRsjsr53mtswKdWtm2fzucZIRi
	 ykFWj7LN/xQJnbzXQqlhv4gQP1NysfmUCN6B6gV/C2XzwZJC5D+EzKWqiD5KIB13qr900
	 7C0RXEFK9acpJxiSYh9UU5zuhy4DZOuL2uW+G31HEtqf0Pzl0wGpqQlzcZD+80p4ehhHZ
	 b4Vdv0xb+T451D4Y3mHQtA7b+CzzdjbcoiUaW0LyRiXmf1WMJ39LO+H2h+0AZo02n7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=544Vs5W0iQqaMJeYnY15/Vfb543TMzE2RWHWwProMBw=;
	b=FH97lInjIe2Tcp0eMvQkyVXCWIK5su2zezRjS3UsJKfNvBz4NDYcwnw7LdRYvcA3qcbV
	 yrIaMPhC6kK3kDbq7j8PrCHPMLQ47U39uLQmq2Rq6On7N81HcXrt/o2f8O3bc4We1uES/
	 29HxUWRPhzCTJJO78dSvhfimfk4AofwgHDXORgJvpB0tBeLsGjgY0VPA3FK3okXf5Kz07
	 PCLB3iuY+7zJKHz6DqZVMiU9I8IdRM8Te3cuouRaIAIrbs9BBDjSy+40B3kGmnqtS4fca
	 kcm5R2PPgcKqI/eJCrFOIurl6XcJI42hxTufo0rlI/iLvTvJZwp5AKYGtTRo9uRfw/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pUf0+7wZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80B7606A320
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 08:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C80B7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pUf0+7wZ
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a1947498bso208775eec.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 01:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793091125; cv=none;
        d=google.com; s=arc-20260327;
        b=ImLPp1HDW+AAyYnEInafWCYENC3AHfQJMz5dvwTKX+0+dUaKlnNXPMhiMahOkVQoZr
         Qp8HhQFQ+FPEolLGyDxVthwGugkkO6EmsaqhXR5+39o5UMH/4U10lBNI9L9cI/rjJHFg
         CwVNui3u2GJ2y9yb+Ai3t1txCV6E4XfIoPDoKetMO32Twt1gi4ZwxemZx27819YQNqqX
         tKOTXZldrODrrJ5f48y/aI692DcECJd9n9JQZOiqANhKWNluBUJvBuMTjxZFpSWxLvuU
         59r82gTLFeKdWQOecvzXYIMBl0mdYzbAYZ3KR0eAUE4VIZ0j/SsakTnndgXbmYmgg4Yd
         4WcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=544Vs5W0iQqaMJeYnY15/Vfb543TMzE2RWHWwProMBw=;
        fh=4NrfZ8pFi/YoLTqFHeaoHRADZvvq06+DH+upPTezt1Y=;
        b=OYTqCPnLQehxvOMNpZKmHsMxE9W2OloT4sFBrWsICbzJD5s3e8I0t1AItTLG623UXm
         Rnbg2DcK7tZ1ilqHtlreVFqM81id5ZK4sm26KzhCzpugx/EtuoyAFj10xzd5FDyNEnla
         iOLsz2HePGKnfJSIcaG7eiNJzyqdbDjpoKEQK+FXK87srqfxmZObAXt4wejh5oriVttg
         7dTfj1ChFsRVQ4Dt24Tn0H54Ixc0DHqhKnm59FqW5yyacf9yGDev9HM6g8NbZ39O8GjN
         1B0Nb93AzogyX1DhB6Rw9AoQCOu26R05T6e93B+Csa49Qwdlxt6OtypmhyZMBkTrHuwP
         mFJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793091125; x=1793695925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=544Vs5W0iQqaMJeYnY15/Vfb543TMzE2RWHWwProMBw=;
        b=pUf0+7wZWPc6vb08pmDR5P6yk7mSd0eNZggr2tJrJzBo7w39uEiKa1QXLZjKmWm7M2
         lND4nL5vqeLmDtdnhvuFcc0vihOhPvYKaLsfE9Bm0ztBkLkB82jqwgxcK0mUGN5F4HT0
         Yqab/3TcmGLFulnpxU5OwJi2wlujE4b54oEC7pPMBoxOyUitR1v8ONiQjoWzoRTs91Gz
         ar2IIukgQB0zJMUt4nOtS62GihnblGXHDNbM7czAPOIgkpWaxrl2p4PVrut6ORDx+vpd
         EhZZyqKNwyJxUGDJ/rfbjW5Bx0ZaZRG2zdnaTiXAaiQxEDeGAtFAkJxEEF4fgs774y7Q
         jLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091125; x=1793695925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=544Vs5W0iQqaMJeYnY15/Vfb543TMzE2RWHWwProMBw=;
        b=qqnmuNfZWkYvmzh9nfU895CnOy5cjC2rWX8roJWulyjhmKq2AB2RW4JKzB63HPWL3y
         Xhnbg0BlcXkvHXMDYmp06rD5Gl39xFf/cK2wIhkni0Ck/smK2N8n7dIdBZswkCLlPcXG
         ABflbuHuMFZZzg+J7ohOVr02BblKMEK3JHw5SATSsa3lYyEoLfTlTV8wQD24GK0/nbRv
         dFGUIRdzCQFj2/CkZDfDlMw74xDgKb7iFkrB6XHN/dlufewT8JwhQE72RCFmnznMVVqJ
         8qFXf2lffPIsM7fvNLjx14+5eDXCT5YIAz1k7OCbTOHDXChrASVs3OcSD1ZqsBVWNHK7
         JFJA==
X-Forwarded-Encrypted: i=1; AKwUvBxLlx5MVJLzluSX9ok0Mvp92N8TPKnVv76WCDsPjxHmp0Okfggkqs8bNkrcpS5jVP42ioeN378YUbw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcB8mxpBUWENrKhMEdxnd8B2kD3fK44RVTaXrZC9LM4ifohGGW
	QgO3oUk9vx8JwwsuBCiZEbkgmHldStF39iyzo8yRGW7XIWSQX9QeXDYVrfhSJzluqKUqLe1SAcH
	56xIQ2pyplScWOlZhi36g1dvbASREqAs=
X-Gm-Gg: AYBFou3H3dx0ByjbwHM9ZZmIsJ2AQ26XMk+e7G/fjCKoCZp5DRTfnMcgVmWBPCnvmbv
	3fG4Ba0CjUI0a1OR+ULqSOKGnuboOUFvz6ytzvTGjcNIj3sAvyVUjpjUxAH2QMkMlJXrRShRyaL
	Q21HGH+9j/qbDkpJDnYMb6Ac8FQvr3OkpUubFhDDYfKxE+cSFxPmmx4N7sN4vOtxGAEHPkOzkXf
	Iv+qAh2MLh2Qx/0o3oX2vYIhJtfLNOXL8J6osKh4D9whoBp79DNo4sbTEKBcFzX/9VwpT+QLYY2
	U0QCQWHFtZiyq+nR1U40nN2KvWcn9KS1glqDlB+LpU8Um+/pPiJtlHrfDfgtu9TbApUeyHXB7vW
	pW1UimBCMifo54CwtNtBBfjnHuPoLppqqcnbhdIoRfMP6NynXdmObu9NKYFb2V1C2/bix03p3lk
	rghJ4QtY6ySxDgWbg=
X-Received: by 2002:a05:693c:8110:b0:359:2edc:e1d8 with SMTP id
 5a478bee46e88-369e836b39bmr13749085eec.5.1793091124761; Tue, 27 Oct 2026
 01:52:04 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004165204.205660-1-clamor95@gmail.com> <20261004165204.205660-2-clamor95@gmail.com>
 <20261026222928.GA15139-robh@kernel.org>
In-Reply-To: <20261026222928.GA15139-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 27 Oct 2026 10:51:52 +0200
X-Gm-Features: AclHuK8LjCWDpNP4DuV4ZuevBx5z2yzl2RQeYjmP-HIeitxouPX3pu1AzADU8K4
Message-ID: <CAPVz0n2rkWikz1CZhkKiZnX5P+NdDH0RfJi69AyVTEV7qw_VXg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: Move Tegra-specific Chipidea USB
 properties into a dedicated schema
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jordan Viknar <jordanviknar@gmail.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 00:2=
9 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Oct 04, 2026 at 07:52:03PM +0300, Svyatoslav Ryhel wrote:
> > Move all Tegra-specific Chipidea devices and their properties into a
> > dedicated schema file, by analogy with i.MX.
>
> I don't really see the point given it is only 2 deprecated properties.
> Maybe those can be removed? Depends if they are deprecated and still
> used or deprecated and removed from .dts files years ago.
>

The ci-hdrc-usb2.yaml schema contains properties that are not
applicable to Tegra, and conversely, Tegra-specific properties are not
applicable to qcom, nxp, nuvoton, etc.

The 'nvidia,needs-double-reset' property is required for Tegra20 and
Tegra30, and it is still actively in use, as you can see here [1]. Its
marked deprecated state appears to be incorrect, as it should simply
be restricted to Tegra20 and Tegra30.

The 'nvidia,phy' property is still used across all ARMv7 Tegra
generations + Tegra210, as the Chipidea driver has not yet been
converted to use the generic property. Therefore, while it is marked
as deprecated, it remains in active use.

The example I added is from Tegra30, which in the real devicetree uses
both properties, so I've included them here as well. With your
permission, I can remove the Tegra-specific parts from
ci-hdrc-usb2.yaml and tailor the proposed schema to better fit the
current state.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/arch/arm/boot/dts/nvidia/tegra30.dtsi?h=3Dnext-20261026#n1146

> Rob
