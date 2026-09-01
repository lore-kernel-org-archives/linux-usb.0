Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68C843E08F
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 19:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290390; cv=pass; b=SjUsbSVvU3YNo9jdOz6z2FlNsyJN5zoN9eGII3UcLAz22LUlC7KRoAXL9acZ6no+bU3rgVjps2OIudpyZ7l6gZN4se7hXef1EEQ3HdktpoEEOxNg1R5KSKxz1Gtpp0kru6yuRy6XuS53cqxYatS7XlBbjE44mojVeCgLofwf7FY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290390; c=relaxed/simple;
	bh=OeXCShUDRg/EoGX0bQe5nZls3cDjB6iKzioYj+6G7Po=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MgTyxiStb0hn2QwHSo3WD54d8+7GHhae4kP8aCOIe4XK+MHkVbAq3TyJuaviFTYjGHwJ7AITugtW4pLd2knoUKn/R6R4KwFzosDxBHoxzHE+tJPGzXF7YnmX/L+xjTD/5wUMbh7V7Q77Uf/+TWo1PAkKxztjueZlcgRzrRezcuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KE/L64JM; arc=pass smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KE/L64JM"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97e9adae64cso42145241.3
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 12:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788290388; cv=none;
        d=google.com; s=arc-20260327;
        b=Dk3M1M/QmPSLDlGfWAAvOr8oqY/VTivD/Wlmwkx0p/Jx944DKHKGH3INPSEzn0fZGm
         CbBgjTTHIVzeDRhznzvadELdwKvLwYDf2L+TmgR2Q12AQuNs4eOOWyhvvpcYpg0Rw6u6
         KZLkD6Bm/Dl6CcSdCopGkC3u+JRgOETdSapUUO0QQVXmj8rk1+Rj9PE/5IFF812mut3L
         BhBww09MBtURTds8sA/1GTU0ai30ND20s5gMovDwZH1icmFq6SsAOUP/Bbnw/Rdh4Je8
         wqGH4mDSMtZ4/zBmZLqCUcXjBCAl7ujSYN1wzC7SkUigCs/L4b/b/LU4LFh3cd2HQu6A
         Dmog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OeXCShUDRg/EoGX0bQe5nZls3cDjB6iKzioYj+6G7Po=;
        fh=un3/iUC0S4NKvKR1bmfeIo5Bkqn3+c+mqSFgfYiOYAQ=;
        b=iy+aEzW89irtTngV0UU7VTMbqRbNX4kNB3AEW/BcQJmPznrhUctCKonMHLqOJ3Nnx+
         1QMlUQbbZ12z18Occ+nZu4vnTkahQPxkqZBbMgFLu+2jcyiHsUTATSTfJqqpeyiRDo7B
         Ko2QKP83r6N/ToeMTS/AQONIXMgUraykOSXnBewfE+R+YXikyXPqhpD35afFEIquH2wc
         4+cGe3GSyP52A/jaE/8+Mq3d5n5FSJiOB7tb7r9FuRW3Qq8KPlIjjXZsWTLaeYWKLppL
         AhrbG6AAfLCv+sRaGbkpr5oZxIj+p0k760Sd8twMRPHKsaR2nNAa9VhncXjeC20GAAtw
         4UxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788290388; x=1788895188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OeXCShUDRg/EoGX0bQe5nZls3cDjB6iKzioYj+6G7Po=;
        b=KE/L64JMYW8qdYveadiAStk5did2TxAzFacqIinZC1vJbJ/Om66sG/K+SaFRkbVNXL
         NX6M249DtIJjag6rfArHwpA5TXgdF3AmQFac1WCjiz9iSDLo0Nh2I0+B34WNvMLnKQL/
         HlhX0EvCdAliYYp2Ykbbw1Nf7li9m1wyan07sFk7p7YMv8Dxu/JL+YBMgDnWxiybBS4Q
         m3feFQuDRnCFxXPLKL2PDUNXbEOsV2dQm1K3U+CvHED5vPDdnkvWyswQvdRWYFHtRI62
         LssFY43Qbqdbxq/VMlTRK9PiehJuRzidzUuBA6v9WRNpJIELzIG/ik68XAKR4MQw6PfZ
         hDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290388; x=1788895188;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OeXCShUDRg/EoGX0bQe5nZls3cDjB6iKzioYj+6G7Po=;
        b=pVcghVFOG9OEgvhIju7PmaZM+2BNU7xg/ve/guDQOgyXDqbJ1sc8bbw9lm1D3l67BF
         9QP/88NhXeK4ZAMFt5LsLInQHO7b5y0sILphm3RrW/JcGwRKtdlBiL2YH84l+sRcJj2s
         WVwMn+lNKjh0kVIIiaj8bIpmVYo3DhwWH5GGg9V453tsV7ld07M3m2z8y1LMz4h+/zLi
         +jGUv3VIb8YB1v+qxcfSEWFI0LlBUBJg0zHuoOBjXC7xW+wJhGgCNCKgu+fv2r3AXYwW
         /vUaAcDrAyEQXuxZG/Dg3qM3M7KJ1noeAynWXuh2iv0tW2yx3LQKvYEah6eOWorHDjqr
         TF2w==
X-Gm-Message-State: AFuF++krWlhUEZKPpwI3SEbnVF+c54oMpGhRi6cL+YxYRdRhuGrsmCYJ
	K8tDai20lBXOapiZ0XMoUHO+ukNqmi5sHviS9kasJCaPt3nBympNF20MMFQyOjMqNFhvzaPzK1+
	Gp7ByyZvYuNeUIL0FORaxUJcOgJ1N8AE=
X-Gm-Gg: AYBFou388xCoaZF/pNoFQIJ7OePTe0FE3P8+5fIT7eE4bjtgOQbHcS/+aI3l0m0CKfq
	fA3PU6VGncTYDLrpqxCi9XqNwamcnhKElzu+SWw+T9vMCzm1g9iwEuD6nS+Ld2iWNMwACjj/ijP
	mCJX//glWw1QLId5PnXDnoDFZFyyNKetf9jToqnxlkniS+1YmiPrsnu9Hjan8c5/0nb5clZNzyG
	CyyY9cB3Pc4Pvj9SHAtz0rcv7oe1dvkUZUm8XQDbXcc7wa+cnl44mUEPWOIELfNR7H+PGflWICN
	C3nOp0BCLknsTtP1UwyhYr9HkB35EpaSeI8DtePytg8+gjVP0GtpPC83coafC/ogQNUGN2Wp3LZ
	ZMzHJqRpSops=
X-Received: by 2002:a05:6102:8090:b0:784:b9ec:910b with SMTP id
 ada2fe7eead31-78a1c856b5amr85437137.12.1788290387764; Tue, 01 Sep 2026
 12:19:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827175703.1549-1-orgads@gmail.com> <2026090139-shout-unscrew-0197@gregkh>
In-Reply-To: <2026090139-shout-unscrew-0197@gregkh>
From: Orgad Shaneh <orgads@gmail.com>
Date: Tue, 1 Sep 2026 22:19:35 +0300
X-Gm-Features: AcwNN1XyWSUHocmPj2MzGIz9O3V7vm4LgQI7ayfr9wFZoCCSHoE-NA8v0K5-Wdk
Message-ID: <CAGHpTBKDBsecVq3Tww7qSo+h9=MVxe-AFAMkUbowK8MbEpu1xg@mail.gmail.com>
Subject: Re: [PATCH 1/3] usb: octeon-hcd: fix the FIFO-flush timeout computation
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 5:48=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
> Should this series have an Assisted-by: tag?

Yes - my oversight, v2 will carry it on all three patches:

Assisted-by: Claude:claude-opus-5

I used Claude Code for the analysis, patches and commit texts. My
Signed-off-by stays as the DCO certification; I ran and reviewed it all on
hardware.

> How did you find and test it?

I'm updating the kernel on our Octeon boards from ancient 2.6 to 7.2, so I
walked into it. Bringing USB back up on an AudioCodes M800 (CN5020p1.1-300,
board type CN3010_EVB_HS5), modprobing octeon-hcd killed the board: watchdo=
g
reset, nothing printed. Serial capture caught a soft lockup in __delay() un=
der
cvmx_wait_tx_rx(), where the missing parens on octeon_get_clock_rate are ri=
ght
there in the deadline; git blame lands on 3e195a80e096, and the cast hides =
it
from the compiler.

The flush never finished on my board because the driver got the DTS default
12MHz crystal instead of the board's 24MHz external reference, so the PHY n=
ever
came up and the USBC registers read all-ones. That is a board/arch problem =
I'm
handling separately, but it made a reliable reproducer: with the clock wron=
g,
probe never returns and the board dies; with 1/3 it times out after 100us a=
nd
returns an error; with 2/3 it bails earlier at GHWCFG3 and says why. With t=
he
clock right, the root hub and on-board 4-port hub enumerate at high speed a=
nd
run without errors, so the timeout doesn't fire on healthy hardware - same
setup 3/3 was measured on (8200 -> 4 USB interrupts/s idle). Builds clean,
checkpatch is happy.

Untested: any part other than CN5020, and the HFNUM wrap path in 3/3 beyond
reasoning plus long idle runs with a hub attached.

- Orgad
