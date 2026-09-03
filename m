Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DBD36C9D9
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 08:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422734; cv=pass; b=Ll6oWOokxmUf0Z+OrrMhwjXK2KA7EWJH876toiCtHa8ZjzpZcNwM5YHLjWnN3qRwmd5oJFVdtkdzZcjl0RY0YHjLlM4c9Pnl1PtDODCE3dU8Xgh+X7jDWUffEegoMx6vKSpGemzZJJlsmDghlDhwG+mTuY5QXydoldG4gJcrzpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422734; c=relaxed/simple;
	bh=fovmEqIqgVXpo5nek+CJqatjdeLkHXnTUt8Ymo9s1zI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQV2NBxnhlpXdlAUgbkNidWDadgIzM0r21rkupoNwzWwOrL2UgZ/ualpk65tAVyR29o4RQb3AAfOP7iqD9VI6fbqT1uc1i0Nw4dWPcRm4AHHpRl20pMh4GqlZ1IHAbMDL68YSV6l2/7vUiAkLYXiOTcwauyppgSzcIECDDR19n8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJbB5GrP; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJbB5GrP"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so2972276a12.2
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 01:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788422731; cv=none;
        d=google.com; s=arc-20260327;
        b=sEqUO4rTL88ubyco0rnLiKtmUo84QMt7s7hec8VOuSCKGHhdgJnXo17hQ8/PdFe5uD
         i1nJWIP8eUTPqcqALCeWNz8IZUkeDW2TaF7qXsmKghylcL8FctxI47XVaMXxR9N81nQl
         Vf9U0mT6ty6IZ4coWW2T6+WyyTBVmDGdQoIOGkY8IVTglMUzXzFiwHUWGHma6ubQL/bD
         psXwvyNx4iSuqpbYpHNjhE5P0Sh6eI1zMdKb0RiQ4ilMTLvUBSt1vGhXoEHJM/OTOwc3
         m8L7uke6dAKJB8fMP8X5wCleq/1i//o1zE9KfZDHuhBGRZ4eWiYs90RwvU8EzbnUX4Pv
         k5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6SrVKYP6RqUW7pG//37NoHw2yaQK1BSwRv3M9s2+zc4=;
        fh=VLBDe9uwnlF8mS7zq4LUPu1M+/CJXac2w+cxUq+E0oE=;
        b=RQJKu4oR3xdnRG4krbwIc7+R/JlKsDqWxlIaasRApIR5vYhfTecyFims8XUYFyQAJK
         KKacKqnRw+G24Nyd+xWrakZD5SxqxEmf4td2jborlSLXYj8Emhp7IwOH+XgijETV2EUk
         HXokQnIAti2NlCxFjQDkm30+KPOO0Ax6xIHy4JgdwVPXiuKb5ybtIQf2LhpkmFvfKaiA
         +GVTMarXBy+lsbABxAPtLNhu2ixIjGT+7Wz+nkTj1dNlrcRG0uuPwjJTF468jNcJtxSb
         eeLEZCTdVatkWv2PWrc+5qV2+X+RCOR5qP20GWbdg6O8/Eptdhis7TGOTenuoB3MlOd7
         dc9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422731; x=1789027531; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SrVKYP6RqUW7pG//37NoHw2yaQK1BSwRv3M9s2+zc4=;
        b=iJbB5GrPlTsZ0MkXt/S6eWY+2Eti33VMfohvB6NiwiMBaUzYIgMW87lgMytpcLI37u
         ST71r4FKYyqGcTT+n3SOWNqXW17KDGPkXYFmYLwiX9eL4j+DbbuKW1maxQm7kRx4vl9v
         JgUZSylKtks3uDc2260p3rGmarCnTxlEeUmP3u7qGMm91oOIJtaVgjhcdFTuahSSVUM7
         fNznplJiTSd3T/3CFAx3HPYFx/1OTpBnKcG79Seg88svbmkZFm3DvId0W29YcdOc+2nl
         2kMh3ENi+jXFwWsQ+9WDwDdvzEhI/Ca4ZZ7+Zzeug0oTyY/ICraQzAoPY9IFnPikE+qx
         axxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422731; x=1789027531;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6SrVKYP6RqUW7pG//37NoHw2yaQK1BSwRv3M9s2+zc4=;
        b=Wt9mBkgGmfMGfwGN/6Iqb07NmmWMWAP3Cru3ICsEfvhjw0UG63E7TojhACCX0/OdkH
         Xc62n3d5HmoRWYUuGNDzoPEfJ2Shz2xEi2RuqVIG9EHW9aFT5JOzHhoKl8u3q4dlccxt
         CGJ7X2oR68c2G6v6a+9pBA77W6lQeYsNbJzI/fzUmBhydNn0yPtZO2Gj8p6gKwvgxJd0
         QmTUqJmXokUHVqu2I3ncQ04+X+QBCg+mYraQ1un6KHK7iZHGJbZJziG75mkRAQheaRuz
         j3QPGyl3gjcTEA2i3MrdteeV+Dm5D5S2SUgcCDE6T+390iNUQ8TxeTPdus8HxxAiotQ8
         07yw==
X-Forwarded-Encrypted: i=1; AKwUvBw5wvliRV+mwYn0A1gRtj3PCzNZTu9/V3OsR4IN5mfrzlqg0VsPnDDwHrIqMFBPryScXnCyyd4Amaw=@vger.kernel.org
X-Gm-Message-State: AFuF++nX1nXUmMC8ZGRVMxZO3YtwwFqkQkEtRrsUqa+FzNnxDEeFWYCo
	rBcFFnu/lFaEB83j9RnPqId/OYT9jprmDQMi26JV2ge37f4E7zGsKLKTiYAkkIdzksdvLOEPTRK
	e5fHOD7S78w+KcyWHrS46RTaWgYqLFqc=
X-Gm-Gg: AYBFou2nO4d9N163cpeoIq5s0k14gA/o2Crjo9tEH+Os1mny4eJwmQKOt95ueRI+3oc
	Vo7VwvvYXc3jy9sNMoBOjkfBC8Mzc99C2CAkdBMUpjUS+H7lddsLkmOkKvMsm2kfcyILSaeqgAq
	P8N6PrT+u7WAfsbvuZ5o35PtOgCJEjCL3NbDojrkNX7eSOjxPuanvurbNzweqXT2RyKwDgAPQhY
	eNi1YSB1SgnvWLgiF4XCuDnT0r0L5W25+S93KoBJJF7forJbmOKO83J6VHWqXgJ0Ht/Z7QLvr6l
	9pMbY2as3mo2V7wgTU3F6UOv+o7QD3eCFwd3w9WjkzQbhyhAFejn8RSH
X-Received: by 2002:a05:6402:2110:b0:6a3:87b7:b5a9 with SMTP id
 4fb4d7f45d1cf-6a682ab9d91mr6190594a12.12.1788422731087; Thu, 03 Sep 2026
 01:05:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2026082042-coma-moody-5b4e@gregkh> <20260820084557.129908-1-khiemtranzo532001@gmail.com>
 <DKTWKZFYC6TL.2ZESRE0NWAV2T@kernel.org> <0198b9fe-4bc0-4e12-b788-85aa2c9f8162@rowland.harvard.edu>
 <DKU2J83B6IX6.2CG1WOB66WC39@kernel.org> <CAEe5be5OjseCMxGQP=QMd1L-muOTDguaay_-21moS1+xRNNNyw@mail.gmail.com>
 <DKZ6PZV65PYX.3M9UEZC4ZMLLC@kernel.org>
In-Reply-To: <DKZ6PZV65PYX.3M9UEZC4ZMLLC@kernel.org>
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Date: Thu, 3 Sep 2026 15:05:19 +0700
X-Gm-Features: AcwNN1WMKVWa1WK1FArX1_9QFOqs2KtBbQ6O2kt-cOvVQdr4bwbcIwMEhE1l-hw
Message-ID: <CAEe5be4cJ5VPu88V4L7i0Pz+joSmJjBOpA=S9knbk44_-Rf9Og@mail.gmail.com>
Subject: Re: [PATCH v4] driver core: avoid klist_remove() on unattached knode_driver
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, gregkh@linuxfoundation.org, 
	rafael@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com, stable@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 26, 2026 at 09:14:00PM +0000, Danilo Krummrich wrote:
  > So, for a fix that also goes into stable trees what you propose sounds
  > reasonable, but eventually we should use the match() infrastructure instead.

  I've implemented the approach you described:

    - In usb_driver_claim_interface(), when !device_is_registered(dev),
      skip setting dev->driver. Instead set two new fields on struct
      usb_interface: claimed:1 and claimed_driver.

    - In usb_set_configuration(), after device_add() succeeds, check
      intf->claimed and call device_bind_driver() explicitly. This skips
      ->probe() and attaches knode_driver to the driver's
      klist, making teardown safe.

    - The __device_attach() dev->driver path in dd.c is left untouched
      for w1 / ccwgroup / pata_parport.

  syzbot confirmed the fix; the reproducer no longer triggers:

    Tested-by: syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
    Patch:      https://syzkaller.appspot.com/x/patch.diff?x=12af8b49580000
    Dashboard:  https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d

  Will send v5 shortly with the syzbot Tested-by added and the subject
  retitled to "usb: core: ..." since the change is scoped to USB only.

  Could I get a Reviewed-by from you?

  Thanks,
  Kiennql
