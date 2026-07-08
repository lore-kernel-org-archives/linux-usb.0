Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4152F3C19
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 22:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783549915; cv=pass; b=qTsFaELfQYcuILdfIlV8KSfOUa35fFAzfdvde7TxF/dLHvrbNQ31gTdBzGa8heNapkVjx+k+4NjetBbUdEZWueBGTbpfVvljxuwV18JGuw6LtQEldYhqnF/HY5v/E1MqakZRK8Jeglbw6wNVLyFweUPH6p4pK7s+pnJUt2mmsKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783549915; c=relaxed/simple;
	bh=M3NYpKurYy+y9G1Ij7agkc7OHcEYpD8U4cPynmWykzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k8gP09UTPAxULf1ux9ExPfLzvYXWJkpu/ekHpv+LJZS/+uNS/CT3qp1B9lAFkUPTaTL9LDs88MgSsmsOIl0FEEED+RIlBlZEvCpUqbJYnSW4nXMtIwArUS0B2EYSWw9aTemKc6DvaZ87HjKsR15B32ihQ9Kgq9IoA3iSIfouqdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NPKSiLPr; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NPKSiLPr"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6a354eea06dso624155eaf.3
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2026 15:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783549913; cv=none;
        d=google.com; s=arc-20260327;
        b=Kq4sh9xVonI35Ag6B4z4LBK/zw6xBCdM0AOsLNitVcNPNhyZjkcPi42dkhnf5C7aCs
         KBZtCfucdFo4PRqtrPLdhL5+UXqgay9XT+UqRXy+Eb1W3/VOwZfas9CeX6aAElSJSJ1i
         etNfCIBibzmpGVnMGF3Nnzqa+VgV2rEF/qyntPj84P5yJFRls61UWhg5hvG0Y+Agywcx
         WWVl/PEICHFC+hs48KQGZtfE2eQD97EF8zNKmm5TYTQBLjNcA+PuIlfIBeZVibRDIq+C
         bmxUZFaBwEJ69f+0xHcovgKzosjQPi0e5Z8W588bVpJ3FA3F6GdZnOgX++eZG3KmxNHu
         2CVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M3NYpKurYy+y9G1Ij7agkc7OHcEYpD8U4cPynmWykzM=;
        fh=neBTqblr5kwIKkaCJz6UjW9eZ5dOv+b1ivOriK6Dtfg=;
        b=EJJfxShGTIsbK4Sudh2rY6thWVWgH2by1HrG0E59c2ayZvS39vk1g6v7snwyEn4WJj
         zD5D09l6GQ/i2Uh4bGaW4fv9YQiFMSgIC8L55RmjCH2njEezLz4NJHLx2Q/lhONNrtch
         pJCB6MOFUJTxerq+9LQw7F7pTfhIzdSPl//VZiBJXKQTIf6LZCzWROmFR/RPRD0Lp2Pq
         b5RYwmWf97idgLS5vIyKzCdI7xB7Z2G5Zj7ad8ObwEzNJBguV0eDesbPRfGZRKxHpeVl
         GNjRxlbmVFSHwFNUQgzstg2JH2O7rzmIEfWTwyQ9grwQJflpxPKXfaUr4ygInvud/0Fm
         UF6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783549913; x=1784154713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M3NYpKurYy+y9G1Ij7agkc7OHcEYpD8U4cPynmWykzM=;
        b=NPKSiLPr5nn3FI/q0u6ayPVVGux2kxEVA4dn7pPNTDMtD7kENjUD5w4dq937wkcHrK
         RGPfea2ZRqHHYi15XQUjKgyEbHwVZVYCxIbOUkc+bOiNMUrkpNB19UT//brNPFlRtgn/
         9bjfXlZ21dSRJ30UX6HpoPcykWPEZ9SD3AUQFvQ+CAkmluzC8MTFff8JBs7Lp8yOWfZD
         cj3L2A8wM5kb07+q8aEK01p1t0r1m0tFNTaluzPngn9OaD8zdcTbe/eXiuIMQH+HgXQK
         HG8DphRAATGsDfc83zjQLDQd7ncxi0i1Ryq3GyzwEDC3UQuBoH+DUgw5tFp0i1jc4YwZ
         rBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783549913; x=1784154713;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3NYpKurYy+y9G1Ij7agkc7OHcEYpD8U4cPynmWykzM=;
        b=hIk8aznW6K36mR2TBrK7pSoN9UVW9YmqboVm7d9VQJBiRlNnQBjPfrvMnqaCYvm4EK
         uyCSnHfCKk9iePRaUfkUU3qhG38h3OFXfHVEtVd06VwujEEFr7Oqgew/G2jMl8UCe1MC
         TGtaFkv5MCRDdF9PcRJzizV9qKZGp+ov3lCnbdPb/9Ddi489wpmZBVzOjqHP8FSymDwk
         Y6CuNnYQeFeI8cOAOCnGWI6r9NJWtON1yCKr6xmnj1FXCJq5fRFr41m9NHhNBiCUxDuE
         VAb+afWtB1rYYT0LKvIfPWyLdpRpe2sH7OufTLN0HHQCgMOaxP8sjA4TThlNOnEZDB/b
         Fjyw==
X-Forwarded-Encrypted: i=1; AFNElJ96A8Zpe1EjvhaImFVyEhk5aatQTPHQwIeXemMoHlRNxPA3E8eaAPL4k5ERB+2F6+JrMgGScV7e/Ak=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXDKDIE80SNCNwXjIKDkrkIh8XUEvN6SGrIVOaUGeIMUwafXVe
	cy4f4PJBqRl260/gqD5fj2E3asTucKsXDJTTU0vdCyRpmFKTRqNKcGSpTI7LnhA4jnvDpSSNBM3
	aVEEN9vZsNEUQeajGiynVANgAz/ZBrrHio0YvGJEf
X-Gm-Gg: AfdE7ckYPYntMRFuJAKTVBc1ePyNiiAl1R1UltKU1PesYdeN+Lr7LKoDtD2SW9VbjKV
	Wu5FEFRK82s3etsdoaqcH/4jzhmyNBlbVWHfkb7wtLKFPp0Lt2nNmXk+zM9i4IdunNTrp2ZmYGy
	6VNYncRKSfCFgmXg9NP4qae3iF2+1KJAMCuLhfIdj1r6WE1uH5Tx/jsRvw5AwYoda8Kyu9ENYZs
	y4C7I5nDriKpTl9NkUmwoSgEUIXmktun2n2i4ivw0w1HWNmBOzpyfHma712R7AABb1r6wE8HiCQ
	7UNR5BDOZhMj4g6HwOh6Ps178QY=
X-Received: by 2002:a05:6820:2014:b0:6a3:14f3:3cd8 with SMTP id
 006d021491bc7-6a36da20005mr2883115eaf.52.1783549912430; Wed, 08 Jul 2026
 15:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625215431.914380-2-rdbabiera@google.com> <5e5kztv2w37ovbjq5lka2626vpfi6x7ez52d6pdzv5cbalm2gl@r5pbb4h5ipql>
In-Reply-To: <5e5kztv2w37ovbjq5lka2626vpfi6x7ez52d6pdzv5cbalm2gl@r5pbb4h5ipql>
From: RD Babiera <rdbabiera@google.com>
Date: Wed, 8 Jul 2026 15:31:41 -0700
X-Gm-Features: AVVi8CebUxuZuoV2BKvMbEBaNqCylnMyEh4OLfQBGOjTq1A1rSTD8RMcB_arl28
Message-ID: <CALzBnUHieLG-NT4bcVhSF2Ked_u2j7dvvhJ3VEwQmwNnxxkVaA@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: tcpm: implement retry mechanism for
 Discover Identity VDMs
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 4:09=E2=80=AFAM Xu Yang <xu.yang_2@oss.nxp.com> wro=
te:
> And should the state be set to VDM_DISCOVERY_UNKNOWN instead? It's seems =
odd to
> indicate that discovery is complete immediately after a port reset.

It's fine to set to VDM_DISCOVERY_UNKNOWN and cancel any remaining
work identical to
how HARD_RESET handles the state. I'll add this in the next version.

Best,
RD
