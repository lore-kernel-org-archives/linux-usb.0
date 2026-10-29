Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256855;
	b=vEowqRyBdCWLP0jAK4v7oYg/Z4iMCCfVJObLRuRTJX8+OdauEMzQ31tHfK3PGryIQjgM
	 OlDb37NMbIYdMsLKLiiz2nkWsxmym0pohUM5aEMIHqj2TzUBHO6eSytGstWeqOqW1p+cE
	 g7ik+di2FJDEcudzW67UFpqV/FxQmGq0Egnk+7TXoLo4P1lCyB8tsWcC0HGyKlBYt/rRF
	 5yyMA2K10lP0bEfFWAJVFNFROLnZ6l4tBTWeePjC6+NiuSNDi8ygNXS4/WN8fNyud6CA4
	 W44Kpc44bfS67gBqE1Thm4fygIen4KAaK2lXGQJm1JAGDyhEGitKN0AUGC0qoNf95YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=z0S0sB47V1uB7otfysvwLuTjpySYB+EOjDjMBhrlTMA=;
	b=i8g+FZ1Y2XOSrihg4EbhJ/MWcrwnDdLDSQ7albDhqWppIr4N061JhlW0DGvX5hm6iaaa
	 XmPKNM5Ub0qIVpV6nIHECkCbvi1K9ubYXinKlFxN7ZHoWkBJfdjO/qa72joaCfOW3SlEp
	 lcRoyao+qyFKwlinoZ3Orn13YEj8OrINjOBspf8EJBb5hbuYazWezA2erzQFiqYNks15U
	 qpU5/AVkmaRIV/VTUhi3tgtcbnJYQlXlZ/V9cGGvrJvkPOvs8RTkbOMYpow4wg70bGdbD
	 0VTYTW48VNPYb5IRrWQgxygyXQBSQmWisG/6nc0j1DEHErMaSVXYSlcmIq2qWSzQv+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VDOgsFrB;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87636606A31E
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 06:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87636606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VDOgsFrB
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so20930835e9.0
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 23:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793256854; x=1793861654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0S0sB47V1uB7otfysvwLuTjpySYB+EOjDjMBhrlTMA=;
        b=VDOgsFrBiE2lmcxMj5zF9zhzkq89I9id/WGR7mtHv/G2wzj92eFrJlG/YgBXZ0M/JL
         c1pUGLn8MN3EIa4mGu1Zj3XWYa3KPIjaVTZ3aOEwsogafZt5rB2ztksMy790BwbOYVgj
         f0IaW+abwt4btg+9pq+dCu/hikAG20zoiicD5rDAtQFyP786LkvFB/NWGBrwBm03p7Mh
         qVjMtRp4V+01RiJxwGMfQ9K/mKAOMNdIMlOSNp8hSeh+n6zCurKyJMotmtxjrrz5GsNg
         QeokT+26Fm4hdemSnWpbvk/bGFSw8akDhRztw4SB+zRi9C3v4r7CrFgDpe8ufVmadxqI
         /V2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793256854; x=1793861654;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0S0sB47V1uB7otfysvwLuTjpySYB+EOjDjMBhrlTMA=;
        b=hMSdrQsWTo3h9PjwCsROKjY7HInK+7GIvVYJOUNxJkpX46eaKFv3vA4czs+NheI28T
         VLvRoj37SjrcjWWMf6VlfFKiiXk7g1/+ehpbOY1bOpcn+hJnKGI7Qui8Q7yAWrKQKDA9
         cRskkclrXBZH2+UGp1Hg4To0hdN8DiZ1HqgicFtEKpJ5/BKQDEaIqhfvIEFPqND96ZKj
         9srDULwsj2Y8MQ7OyjA/WzhlyyJaB0J1iEBS4Jo8jjWl8XMb1Yu0RKhGrIGti92WvKJJ
         5T8SX2ErlCPL/h1v0gq9LjXk7KIshuOy5K+ghARtwFehCo0jjI2GQZE2V62R/B2SM7Xk
         Y0BA==
X-Forwarded-Encrypted: i=1; AKwUvBzDHBoml9+LLuhTychHdN2gzf9U4cCOfLRHMsl4JqI+ZzeJP1AYF5TqMM/9ipVe4PevfqhmHQZuMCQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQZTNIq9ityDETQ/cDz8SjOrW5k2161NyNTaVvLKkDKf+O2YHV
	SF8kk62yevibJrcNgcw3jfkbU27IfpKLfphBzFxRaGraxJuKafzeFZvS
X-Gm-Gg: AYBFou1lazfyTTxeqLWQSkGNn28udqPsAZHd4XjCxfwvT3TEiPZbMLjpN3oxU8T3LWY
	7rGL9ZuTpW8zOSVw9gGzad8e/gVDCyGHU+r3tC6jzoHp5iB0cF5/ITAHa6uC2FIbaqvPGYwPbpK
	YxkvQi5JCMDFZ5Xbs/CB7sDD/yOcDobQPXfuNamaMqOMxuGuARIKrcSkZ1jhmlnwdZbLxmpL/iN
	+P4aMtEmP+R7kAntU/VbcULzgygcSq0/qOoQ7mc+HiBRzqrUgqpE2IIQpMhh2dtFo/Mtg4hHyhe
	y5Pix2BlJOJwJm0UAZRqReeJXqD4KZvZkvV5Fxgas+1hVdvrPkajMlMBlcKXRTClG+USHRRB4Kt
	ZNUaxhdfm+pRQxV3EqWqhwhBl8RSqelw5IS7vMn/tb+Yw7E53qwDS708W6plvrRibyAA7Y8XuX9
	OS4H0TYAuERnQEPM7TBvWj/7V6n6BaA7UW3vT07pWmlSWyLD28gsb/9M4G+lUV6omP/4IxRsaWU
	ocvnCuw452FKsP/b5EjbxBo9pEpQ9LkAvr/n+5gWxI6TGXVpLaBRFXInhybs/pQ69flFXiCiGjE
	+wWBvisSuyIi5b+bqANWnd0pVn1WWZ4Fax8eQw==
X-Received: by 2002:a05:600c:354f:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4a965ec95f6mr105795345e9.10.1793256853891;
        Wed, 28 Oct 2026 23:54:13 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f52e2sm51260925e9.9.2026.10.28.23.54.12
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 28 Oct 2026 23:54:13 -0700 (PDT)
Date: Thu, 29 Oct 2026 07:54:09 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: yiyu@yiyuzhou.io, <linux-usb@vger.kernel.org>,
 regressions@lists.linux.dev, diogochaves@me.com, raoxu@uniontech.com,
 dennis@dsine.de, gregkh@linuxfoundation.org
Subject: [PATCH 0/4] Fix problems on disconnected devices in 7.3
Message-ID: <20261029075409.4b203658.michal.pecio@gmail.com>
In-Reply-To: <20261028080734.173da0e4.michal.pecio@gmail.com>
References: <20261027184117.2461065-1-yiyu@yiyuzhou.io>
	<20261027192128.386082-1-mathias.nyman@linux.intel.com>
	<20261028080734.173da0e4.michal.pecio@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Oct 2026 08:07:34 +0100, Michal Pecio wrote:
> Anyway, I think it all can be done with a bit less code, while also
> handling disconnection during unlink. Particularly on EP0, multiple
> URBs may be submitted by different drivers and/or userspace. Just
> because one of them unlinks its URB doesn't mean that the others are
> aware of anything being wrong and won't stall for <N> seconds.
> 
> This below is a rudimentarily tested RFC but it seems to work. It's
> simple enough that hopefully it might even be correct. I will test it
> more and write a changelog later today if there are no objections.
> 
> I tweaked the logic to return everything with -ESHUTDOWN and not
> bother to assign proper status to the URB which halted. Intuition:
> we want them to give up, not call clear_halt() or reset_device().

Actually, wouldn't this break the "resuscitation" feature? Does anyone
depend on it? Hell knows... I changed to give back the halted URB with
normal status and ended up with similar code as everyone else, but in
different places, so that URBs should also be flushed on unlink now.
Took a little longer than I hoped.

Is the last patch 4/4 necessary in practice? I guess it probably is.

As for disconnection of USB3 NICs from Renesas, that still works
without hanging the HC. In fact, we could even Reset EP and Set Deq
on the interrupt endpoint and nothing happens if it's not restarted,
but these patches here only clean up EP0.

Regards,
Michal
