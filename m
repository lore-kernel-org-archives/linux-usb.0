Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726B43ED3CD
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 22:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783549443; cv=pass; b=S9A0o8VbVcyIDYJSZoY8I1xPrCEjAtOSvOLeWJ8ua9RCIjoDKxYQBAeHBX0zUBUzlyJpNrvM9wvFfjknnw+yRBNxufvhzhMOgEeNddDe1SN9FRUiYR9cWrkBVXIj4z2kiAPbsfo9xlkerFW2l+wdgOnLxDoj6LqWz7dJL9kdGGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783549443; c=relaxed/simple;
	bh=jdg3T50er9MytSv9eMEBOZEkYT0CDQly6E6qnqaXQL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YpupnfZhB4XcZ1zi2VPCwAXPVQxyNwVTgyS9SvpmYTkf8YOGoH8T0pbhQcMcqSd+a4ex64vXEAhVx6sAbiUWIXgAfao5gxn45U1e1DfT/EIACLVvdrmImDMS++6j7OiTiClCtLpOODuKhnx6rZ1wY9jDGI2VkpDmfItEjbI0i7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=af1yaPsI; arc=pass smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="af1yaPsI"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6a31c05e1f7so76582eaf.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2026 15:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783549441; cv=none;
        d=google.com; s=arc-20260327;
        b=LDYkvIRMpC60sul506iyccK4s1MbaTRO9tZ1BBcuiyQccK3dFtob4ihEFt0uGbKwBt
         kLttjtQ99opvNFziGxFnVfxqWhweBUPsN3SnN2o5tD59h9FnYsNPjybfBGvtNX/tSdfr
         QlUwEknO0YwAO/eFUVCsI4vmMU3hnbb3u/SupzwwmFLraRoC4r+a5+mQxY98UBLeoMgt
         5VzJ5vcE1BlwvhvCSAjNMLzhbVBmjz8XOIyWY+oPTwUVOrvhGDtrvijRNxjWLTcF4pqX
         Zimts+nZKjPdP6MJZ/gl3lf4HSIDoUwryaFrUNNLQpsRFodAJ3pwf/bO3HGb4W/WaCUH
         mJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jdg3T50er9MytSv9eMEBOZEkYT0CDQly6E6qnqaXQL0=;
        fh=xOcN8z9DFk3fil40k97DDrfgAMvMoVegFadmfN3iN/4=;
        b=R8VUiF3MTzapAtk8G667ZaRonhVgvnAGuPXv4qT6calzBi8tI0tgwioedTW9V6skFe
         ymt43xWNxxbrXasfiod1x0I1laLHhNY44iSlk7RgEMavOyuPeS/XxPX/vU4cHLcVbzti
         dnc0AsFcyAJO2qQC5wxnWHWtgxbxsTfn+HPVECjQqqFjowql4UKeG7c2gBqs8usFOxQX
         qY4gHlL4onn2jV5OHZ0wGQeYV+TFOyeNALNi8+fjoPA70pb+z9nyYsQe0Z6M686XWSBa
         vluMAJB6k4lzwpWTG0jPZFeyhUu7kLM6Vp+iMBYRcuhHHtt96oi52l3IDatCCHTbCfKG
         m5Rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783549441; x=1784154241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jdg3T50er9MytSv9eMEBOZEkYT0CDQly6E6qnqaXQL0=;
        b=af1yaPsIwe2vJhfRqW1CJycnPTi7dWlPGc7HrzcvB7gP8jS21FZ6atYdAEzE29err8
         NYvmxJqfv9Wy9QabWtNWsQ3lmCBgOWxopk02NmpaHJmpcSbI9iDWnX5QIudv9v2eAyKF
         gxg7afDoLhNj78b82nYAkFPqna7vHLFXu6OqmJMJ06UlOOjCwFzQwoBnB7SAkilUr3PI
         fyF8t3JasGzREuLHselKIL7hUUCQhqxp/crKISCmwlcSxnQoiyfzF4R/gCjUhyUHafAb
         whcnpFaPoklQk41a9jk2K+o32GLq4BbHCJO0VjlEkN6lnEcPQfHH83OJFGYqyGb93HrJ
         uXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783549441; x=1784154241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdg3T50er9MytSv9eMEBOZEkYT0CDQly6E6qnqaXQL0=;
        b=Dhb61t40fj3vwJGSKSbzn9PLq33LT9Qs3wNfTmD6nc5/D0FDUeP5xyMr5j8jiO8aUq
         WSOImvzUKZN0mkFb6dwv59NvaXS2vf1QRZACUMRpAyA3RVmdUF5/3W4cm35ueTcmx2N2
         2EoDGE5d2zaC230Uwts3RYgoe0FDrP6CBGSVJ9vSkAFef+YdBGym+mlKIYa+zn9VDodA
         GGsgaCz+irZS2w6+t3PPcNPL9HkYSvWsl6fcpGIUS/cxl5EdaTdowAfqc1rXfVXGSGpC
         omBo8yPHh2GrKZMHw/BfLXiaxcIcl164KXR3zhdPAuaauxKq5fGnb1GBLyTccWEGO2cM
         Pyog==
X-Forwarded-Encrypted: i=1; AFNElJ9lVV128oZXh9yOqsLKFucRYG1ArEg4dXuvP28rY+XggJvpMtg8nqoLfO40/S/5/T2w62CbHgj7qLU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyciyAIl9xq/zTW0FqMMEIR8PBml2bKJ+BAlwYa6JvoxSXRW8Jf
	ugHqO9SkdH56YU4THAwDSJujby8G8rHuTLkx2Xg1ZdsaAKhmnfewqMHe/g6J0KrLagqLePSlds3
	qtTRSQTeCAsOuvPxo434/FTutcV4AIHNAqsNTbK5i+M6SsbC/Sr7cvmINfcU=
X-Gm-Gg: AfdE7cnX06sGB4L+8Kpz16Nw87JJAY/MWFkKpZdZyCN3e+TAvvdnSArkGalY0DcPGyG
	8PUmmwrVF2ocxA2EmKqZHHlVayVWG9IKK8mav4doD5Xo/xQ8OuPea2EiK6+b41KecsPwcClsOpC
	nRdn+2NZ19OQxgsYro0hOEbcUKu3FbFdrmu41PIy8embGlqzVDOeicvisu/1KvTNI2LPteOOZN+
	xkHedRRetiyGScNf7APi6jZP2CGys7naH45Ff1q0rq2325KVNAiM4PDHg9jFv+Lv8U8dR6rfkIr
	6sasO2uAwJvAr0oEf4pQ1q/EeAVjFeAaGItXdQ==
X-Received: by 2002:a05:6820:55c7:10b0:6a3:71a9:4476 with SMTP id
 006d021491bc7-6a371a9637fmr1517212eaf.58.1783549441041; Wed, 08 Jul 2026
 15:24:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625215431.914380-2-rdbabiera@google.com> <uwxhwziw25earfgsn55zikihnv6b4g4cesxlccrei2opk5exmn@a5wu4h5sg35b>
In-Reply-To: <uwxhwziw25earfgsn55zikihnv6b4g4cesxlccrei2opk5exmn@a5wu4h5sg35b>
From: RD Babiera <rdbabiera@google.com>
Date: Wed, 8 Jul 2026 15:23:50 -0700
X-Gm-Features: AVVi8CfISawD2ORKS9kSIV_JowWKqBthGnRIBLkwk_Fzc7WU1566eZTKqkbyKGw
Message-ID: <CALzBnUEBtoiW1+hBBxkvpp4+8f-3uVyg3+4LKX8ezTg6zeOfTw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: tcpm: implement retry mechanism for
 Discover Identity VDMs
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 2:45=E2=80=AFAM Xu Yang <xu.yang_2@oss.nxp.com> wro=
te:

Thanks for the feedback Xu, and apologies for the small delay here.

> Can we utilize FOREACH_VDM_DISCOVERY() just like tcpm_state does?
> Then you don't need to write them again.

Makes sense, will add to next version.

> >
> > +
>
> You add a blank line here.

Thanks for the catch here.

> I see a loop: SRC_VDM_IDENTITY_REQUEST -> SRC_SEND_CAPABILITIES -> SRC_VD=
M_IDENTITY_REQUEST.
> The tcpm should go to SRC_VDM_IDENTITY_REQUEST state only once here, righ=
t?

Interweaving SRC_VDM_IDENTITY_REQUEST between retries of
SRC_SEND_CAPABILITIES was intentional
when SRC_VDM_IDENTITY_REQUEST was implemented for SOP' in order to
pass USBDP Compliance Test
timing requirements. This is consistent with the current
implementation, do correct me if you're experiencing
otherwise though.

Best,
RD
