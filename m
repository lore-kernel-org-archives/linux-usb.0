Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCFB451980
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 12:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548655; cv=pass; b=nD4ufAHoCDEaskUy/pkGazp1HN8rAaPBT9bxko53imqPkdj3SSDtAgffEyE5coXVms22EVS/CR3cTK/MC43OrcgPF2d4Wfya2Qmz0OIPDI1JxCYy6n1PkfIbtHYNO6R7JysENjanE/NR1em0NN1spnUGmq0ar+hIPe56TBsEDfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548655; c=relaxed/simple;
	bh=W+GVodrUTNH4Yy1nDEnsPN+ql8MzERFY3f4gbOktc0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k88d7Ap1fAZPK4gRictUS1tYT6splOicPIIe/F0C9jfCxX3lOZP1vqJ+D70Jip48PAc6YtTz4a5xqaLMU26HFVtMUPtKb/tB5VQSVIYopnudqrDmtjTIKLMFbPadbaMvMB1vP2M3YrhOUhC4TNUDwuqZqtIlIO65WVncazk04to=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQNlduzi; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQNlduzi"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so1139845eec.0
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 05:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791548651; cv=none;
        d=google.com; s=arc-20260327;
        b=JRlx90FsecjJyP4oMCwM3OPX9/jYQYezOztw4uZFgZ1nRiuBH7doKuiPpIWZRQeipM
         CE8oj886INiOhAQO6zRN4YDNpCG90phdqQWLEbnm/0ambs/TtyYu+yxeNi7lw84JyQeB
         VKfitg6L0b+xbTBQ9op0+TDTQiedTVTA7BjW9pmRKa9hWdS8rtmXgdZwb6dnipn8lVho
         R4FbJO6uNwE9W4v2GC8HRbQSGfbtpajhyzdtdWM1vgs/9K455MpCYNAxbUjEeXbDjAWl
         xqdB14TjYHgM7b/kMBeBQBqkuo8Mx6MmH5Yzr2t6/od/WoyvdyY+JV6Dyt620Dr8SSVb
         wBAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6w7iXC+S7wuM/jPa5o9UtD+49O2Q2UL2gZUFw1fUahM=;
        fh=dCZMPLcavW0SnYLfG5lvMQdbeVJjL+upZ1jA2rGkBOg=;
        b=GVrHbHVIGmTfn8lDdGJ/+FbVcSwJgSQYUqAjihx5t6VnlLZndPWH8RxpH63XjhFPmA
         Lwary3OLaIZ2ZNZeI7HDa8J4EAlwxBfexixgf0BT18dslU4rG7F9Mf3Wag9Q4yS6t4oT
         RkfLiGPzNiGVUDg5rxnWvFMO4/0hR+YQ6LY7CWM9ufWcTDGLT6RYfdsQ3qFIMNnFwggv
         wf839UJv2CtGufDLpew5iMI1P8kl4JcneGVzHlwsytEB43+RW5sKzBj/iCgv5G+Mk8tn
         9Z5jGB236exu6/LRjtgkgJgMFm+NTA+AAzRzcOHsctQfJTstR82xipQ4MRUs5MXr2T2q
         K7dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791548651; x=1792153451; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6w7iXC+S7wuM/jPa5o9UtD+49O2Q2UL2gZUFw1fUahM=;
        b=sQNlduzi/63ZkkDCnIriT6G1Yo+AA3Y+4+9LPmjw/rerzugD3/SD+i/77xtHkd+qyx
         bY+lOjX0+YI7iKJxXPVNq89retWljHuBJJGbtaNmppRl/ucggm8qIZJEi6GUTLVnCWBQ
         WF4F+upwRL011bRU17x5wixbPPTqTfjHsDjBgeq1ELQeL96ZUrKCASVv6/3U4TZpby2U
         uJcqNgHjbLBNXdLN7cT17Sh6S8K82rrguw3XFZhUVcHXey2On6hP1BG/aNRwISvLIT03
         f/KTTp0ZspPJPnsdvofWi8P0mq1oR675EFAjpj2d5HqVvE7nCtIFx9h5Jxq5/bWE+LFO
         jdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548651; x=1792153451;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6w7iXC+S7wuM/jPa5o9UtD+49O2Q2UL2gZUFw1fUahM=;
        b=nkwPiWvZWSsJAejLEO1LeRtzYEPd5rpIBUT2CeMsEszOPWtoyERPzogkC4Qp2fKTut
         unJYStdU/XnBBrb5/QlrnAUGfjiE1n6MWgYj6jQJQLXrJlOXCk/q1O/uJGRngvwd+Pl6
         uFnvBrVoOt/VVlxZwtkeIK9EfnRH1lzOCE6JyJKzBl+S99Vg0iLKpN4KWOX/PdI5dpeT
         F52Nlon1P6pvpz6htiNu3N9+bM93jfndH68poEw/DCw2US4dmWoYmrZwPVf9dbWwFpa0
         fqxXplibvYCa4AglK9wbEa/K5ft2BO8K2kDK424EhUZhXuPEAFetk6FQ6+1PcMgtBcTJ
         rIFw==
X-Gm-Message-State: AFq9FYLPvK2Jfj6uBAcnHHUfd98Ea3RWGSS89KzidPgdQpUa/t2+LLQp
	LLrHNPev1a3A/zMQ3FY2CvA4faBp5rcZ7ChcKPGNvhghglvS3+JWyClhbTOyBBtsHjRLkzqV9EL
	vRLVmjz1KHP0TN4+311tQ6PzrQRusIg==
X-Gm-Gg: AYBFou1kq6OkMlErPHAjoA23TOF4BDJf1l/ZGHSfDRt5/2XkOl3suarrBrpvkOKHIY1
	aX5Ypq445Bpy2aXghTChuYVI1/IqMOBRxNQKUINzbZzdYDqXuqyim7vBmESbxytxv+jszMvGCZi
	ZzCRC09yZ++kI7dofqYp3Hv5NrhE7yRV+ewoB6C0ekRtCqcx0P0FAwqY4awxQR0Om+DQlN5Jxph
	oFu8qrpEImcskCHrcKOUZ6AYytAi2VP6u+/3SR7GJ17sIHtZB5HxGnTRcr9dd6eyHSPl7Fk7sqX
	tJFpRWsDQ+ADr1WmBSkdd2qGle9puWAHmMaSCvo9rwIOJbbqW9a5UHitpE4VsUmWg7XsU9W3yA0
	qFamMZYqMn4oNMMF5xkWOp0BW/oLL1mstcBLTgguO
X-Received: by 2002:a05:7300:cd8f:b0:351:75b5:885d with SMTP id
 5a478bee46e88-3537dfd8470mr3507309eec.17.1791548651179; Fri, 09 Oct 2026
 05:24:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAM6_QD_PoTdwdM7DvzzgHRs-G5EvQu-c5oNGve=GuKV4wFYAvQ@mail.gmail.com>
 <CAM6_QD_xAyTFVvYKvCrrZmS+fV5DBBje9V=VdkDMMSpt2ussRg@mail.gmail.com>
 <20260928120343.49e02c07.michal.pecio@gmail.com> <CAM6_QD-CbYSsmic5LhpMi-aMXuC_VaniELBzaBeWO8SWm4UONA@mail.gmail.com>
 <20261002104355.698eaf00.michal.pecio@gmail.com>
In-Reply-To: <20261002104355.698eaf00.michal.pecio@gmail.com>
From: Dane Linssen <linssendane@gmail.com>
Date: Fri, 9 Oct 2026 14:23:57 +0200
X-Gm-Features: AclHuK99jZT_xKU3QNXdrk-r0fVYuUviUqc5tIgyboVM9TB_HTssMakAr2jlGvc
Message-ID: <CAM6_QD_z7eT+N6HieHyZhPmXqPxKqeSYKX8OK--M+rN2VAsO_Q@mail.gmail.com>
Subject: Re: r8152: RX stops until rebind after -EPROTO on the bulk-in endpoint
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> You could try it. We may consider increasing retries in mainline if
> this turns out to solve real world problems. Though so far, in the only
> reported case of 3 retries not working, 10 retries over a span of 100ms
> weren't helping either...

Thanks, I'd like to try it. It needs some setup here first (signed
modules), so it may take a while before I can report back.

> Any results yet?

Yes: three more stalls on the same host in 11 days (09-30, 10-04,
10-06), all with virt_state 0x40, each recovered by the watchdog's
rebind in about 30 s. Dynamic debug was on for the last two. Both
start with a single burst, and in the 11 days there wasn't one
"Transfer error" on ep 2 outside the stalls. 10-04:

  22:36:09.251 Transfer error for slot 4 ep 2 on endpoint
  22:36:09.252 Soft-reset ep 2, slot 4
  22:36:09.255 Transfer error for slot 4 ep 2 on endpoint
  22:36:09.255 Soft-reset ep 2, slot 4
  22:36:09.258 Transfer error for slot 4 ep 2 on endpoint
  22:36:09.259 Soft-reset ep 2, slot 4
  22:36:09.262 Transfer error for slot 4 ep 2 on endpoint
  22:36:09.262 Soft-reset ep 2, slot 4
  22:36:09.265 Transfer error for slot 4 ep 2 on endpoint
  22:36:09.266 Hard-reset ep 2, slot 4

From there it's Transfer error + Hard-reset pairs at about 275/s
until the rebind 40 s later. 10-06 is the same: four soft retries
about 3.5 ms apart, the hard reset at +15 ms, then the same loop. So
here all the retries are spent within 15 ms.

usbmon, 2 s from each of the three stalls: every bulk-in (0x81)
completion is -71 (571, 553 and 551 of them), none succeed, and
bulk-out and the interrupt endpoint complete normally.

The other host with the same adapter logged no transfer errors at all
in the same 11 days.

Dane
