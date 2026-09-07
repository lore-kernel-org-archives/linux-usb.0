Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958E54CB8C6
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786023; cv=pass; b=im0bPAJX1vBc+74FZJ95OKyPQgZUP0PRshaCsSp7dpv5/CYfJ5kn+aSYp4y3MykVmb6fm9jw0I+V89PnNzeKFY7BDoBdiAhhTvc3tJo35xuLblKYdf+LgM785fmziV40byjwBkQDMrv4BawOuWZA5jKt67lDsvttX7SIxXKoHSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786023; c=relaxed/simple;
	bh=b6+A2ISdRBcbpKO6oizpmyMUlOrzrgdkpNrksSx2FOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=urh7C8Pgm9Owk4hyvjue1sm3VT1YM3oByF/3ty2hhvOl6qwrQckt/6/QXmO1PTRP6OQE6xJXpcw0o7oemHucieXllmLTl9xWeMOuIlG619phsEI9Jokw7xfNCcf1SpSCWFPBu5lWd5I0/M20rjtz0o9o31tOVZ9usk+spfyba68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IE8cQ3Wh; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IE8cQ3Wh"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-9104956083aso23634616d6.1
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 06:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788786005; cv=none;
        d=google.com; s=arc-20260327;
        b=NJ5wDxSgH5XE7upEpKfM/4/FBICXhdv2rv0AMdkZ58RnlJ5ySvttTutICzj7l1p2JL
         ztcdOD/A9K7rsc2YGA4rGWLjw3jq8Z1DlgDbRhHWDUeGIA3kGEFlR/kkby2smkQ7cLGs
         ZAY/0P4ERCEAhSByZy1aUnrdwIz2/cjjJFS7PGTYUyzTmOA6fJUKF+o36pAOGH1S5UR7
         iKXxUuWM/VVcLc2r9sPVgBy/UJSmpdvTZwVkX8RqwlzNrFnzwrR1YH/uGek7MRnsdD4r
         +Fd3BE28eb3HtN4DfDsGWlZQIFP/nAAIEr8H7TKmQtRPud3HxBnTiLDn2i/yc+pPJegr
         A+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q4unjDaUxoO7q3buXkbHxzmHr9BkKAP8ixwUMhw/vWE=;
        fh=ByvC4Pqh+aG+ZhLoSdSrFF40EOIFWI49AceU+nfugA0=;
        b=OnpcRhAN9bVmbLRE66jsJqluf1Bq3/lJDB8XdvfJ+P+6tbq//tXuWNbTiBNF4nj9j6
         5Wonjad4RBCXdpX5ab1t5iZ0fPB7jn6y39rqZbRG20GLNE67x6YvIwWekb+fxWfN2512
         yum3sEftEiYdFs3mqzV0QP3qFp3/2cn+zPbDO45weMHwEET2dAxOOTDE1uYMcu3M/Crk
         PEzPwvv724/ELvJGrDVEEZZ3eUmZZoWfy9e4YdKDz33880dbCZRYR7Tcn2lhte6+BJF5
         RmW/a99EuaZyV3AWiFzI89MlxgmHnzx06o8ausEmR22jzaqoMV+17WdZyzEdpWxRzGJr
         hsVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786005; x=1789390805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q4unjDaUxoO7q3buXkbHxzmHr9BkKAP8ixwUMhw/vWE=;
        b=IE8cQ3Wh6I4jvG9mRwAuxLSUEk6wpj5Nr2taGN0ClAke+QFYnRWPnGFcTVVp6CD94z
         F9QQnGkOB2KwXYjZzBcMAj6QoY1vpW30R6X5k34D0yw8TeGmg1ft0VQpIxMkjyRgFjct
         yAj/iPXGWl0xC/K1GVm1pMnbaOd7J4TcGnt1HDmNvbT81xmYbimb3zhoNNYn2T+5fzdJ
         s0hyujyF4H12hYVOrsFLYwc415VShi5HO7UzrI5dJlzQIrFri2QylL3IKzPYEMe9yZyO
         JXKQOOKGxAIZwTL529fw+4JzX9DDFEiL5FoJk+OaNHvcU8YDGSnYCswaayuRh4Z8jOih
         5GcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786005; x=1789390805;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4unjDaUxoO7q3buXkbHxzmHr9BkKAP8ixwUMhw/vWE=;
        b=Ttuwj25OXiX8tExdmUbcy0yaegQ9Y1ANjkiCABDg/Gmhxkd/Dz21YfSZoKjSdIzVwd
         CpxQEM9gyUNPGAwVstbnPN/Piq3jIlv2fF8qz5Rv6/NhbVZpGaUWlWoSq1Okh4qWoPgZ
         T4X6xXGKyuxee3B8cAyYaLLsZae82mlbrawH1h5a+8lTCsd/ao9dRvGlhxPDYYZf9GkN
         88eyHyNbCKK2hHs0wNtZ2NeT4NlxD2yUWsMXjopaKPAjFK/Jqp5TcuLfQMmT0HTb8pzY
         lHoBxrSLsdmyZiUoZPGrQVunlFCLEBRlBuKzMPA5G5D/nP13gSH9WZ0BtdrVLQdNkgNJ
         CgDQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3iiXVyzgHFVHs3JLwpoB8s1kaHl2s6Cqv6MKzo6GKKVxu/1CgaehJI6Pq22gJdp+OrtAlZs7IjkU=@vger.kernel.org
X-Gm-Message-State: AFuF++mURK4RApjl8u0EsuIYrwjLfAs/1kyx06zgPcT+/wUW1jyh7ExP
	W++A3w3JqdjmUH+mzuX+ZoLKnSOwfOafkc8g623LoynWQY967gKRVpKivwZJiB8c8w3SkXtemtG
	im6sLYQRFyRpnGAbWUyUtB8xTDVootps=
X-Gm-Gg: AYBFou0mdPUjoxWSdUa3r0uI40sv0MJAVnjcnIkpsEUlkgPB9Dvh7CduedADXBZCSv4
	/x5GyXvLn+hZ2+f80eknmGD6FARkWgGs8VB0q7kG9vRcLDeLYQARhLw/4cKyNZtFcBMSqE/M47w
	FebAi4uDoPFVLa+tOAxkmMJ0uTsC1hP7jPQXwjLeKnHeRBlXmtzwnC4wfLmJytaXrAj8QIcHgMR
	plBdBzy/8F6dJU5qrJljGE/e4R7/Svwg6xLc+3Sb8SmWyqw75DnWJJ2o20fIQZmjTT5P39vuSud
	bMMEBML2gm9iA8gy7nQCMhPW5aD/tJBYgtCBFwOKDrNMlsBgnXBe86JTorEtYD2yWDrkQ1bM6j3
	M7ghdY9/33Z1VBIBx9JCyeLNrzlghWek+OlfYbl05x9Y3wyvZyERdRJkWA7s=
X-Received: by 2002:a05:6214:3c8c:b0:910:345b:4b2b with SMTP id
 6a1803df08f44-9103f0ef808mr315339946d6.35.1788786004992; Mon, 07 Sep 2026
 06:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cd57f283-71e6-4531-a311-1180ccc22ab8@rowland.harvard.edu>
 <CAFmvuTVH=mVMZNoYnU07_WA+cBc4m+UG2BBTLwF5KWhcj-z-KA@mail.gmail.com>
 <908a5b29-e6d8-4595-b451-6c328e25c60e@rowland.harvard.edu>
 <CAFmvuTU5HnBKbve=v_C7Mhw2586rR_8qsRNua2XPokgKy_o31w@mail.gmail.com>
 <0305182d-5914-4022-a0a6-1ab4221b0a6c@rowland.harvard.edu>
 <CAFmvuTULxq6O0t7FyhEwnGVdMMpbj1yZrPN6mVRDWTgF0ODJxg@mail.gmail.com>
 <1b92cd86-fe64-43eb-9539-53a559cd14e3@rowland.harvard.edu>
 <CAFmvuTWw90k+Fvs5Ve=1nxCDSQrzH7rytY-3vjGwv=edQOCBPw@mail.gmail.com>
 <fb56064c-6481-44b3-88e5-8e5ff7b85703@rowland.harvard.edu>
 <CAFmvuTXWxQJUZfAAC=vs5QM=myDLE-o0jZZ8OXdqiGioPkRwfA@mail.gmail.com> <f928b74b-ce57-4454-bdd4-511b823bf742@rowland.harvard.edu>
In-Reply-To: <f928b74b-ce57-4454-bdd4-511b823bf742@rowland.harvard.edu>
From: Minseo Kim <neck3922@gmail.com>
Date: Mon, 7 Sep 2026 22:00:00 +0900
X-Gm-Features: AcwNN1WW1PJiM_eLvotCXs3cbjaonNS3NMC0jqRc7VUxmhkj_F2d7QQJjGBD2FU
Message-ID: <CAFmvuTXwUiap39-FHv6aqGbJVzORRx8tV1QfN0BDjJaPsbfKHg@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

> Is it okay to add your Tested-by: tag?

Yes, please add:

Tested-by: Minseo Kim <neck3922@gmail.com>

Thank you for the time and care you have put into this fix. I have learned
a great deal while working through this issue with you.

Best regards,
Minseo Kim

2026=EB=85=84 9=EC=9B=94 5=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 5:10, Al=
an Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Fri, Sep 04, 2026 at 11:00:23PM +0900, Minseo Kim wrote:
> > Hi Alan,
> >
> > Thank you for the updated patch.
> >
> > > If you trim your patch down to the parts that only target the AIO rac=
es,
> > > do you get anything significantly different from my version?
> >
> > I compared your current patch with my AIO-only version and found no
> > significant difference in the AIO cancellation state machine or IRQ-sta=
te
> > handling.
> >
> > Both versions snapshot epdata and ep alongside req before
> > usb_ep_dequeue(). In the directed cross-CPU test, a control based on yo=
ur
> > current patch but without the local snapshots of epdata and ep reproduc=
ed
> > the earlier ep_unlink_worker() UAF; I did not reproduce it with your
> > current patch.
> >
> > The only substantive implementation difference I found in the AIO-only
> > comparison was the criterion used alongside the req->actual check to
> > decide whether to queue copy work. My version used
> > iov_iter_count(&priv->to), whereas your current patch uses the explicit
> > is_read flag. I agree that is_read makes this decision more explicit an=
d
> > avoids requiring the reader to infer it from how priv->to is initialize=
d.
> >
> > With your current patch, native PREAD and one- and two-segment PREADV
> > copied their payloads correctly. PWRITE, PWRITEV, and zero-length PREAD
> > and PWRITE completed without invoking ep_user_copy_worker().
> >
> > I also reran the original null-ptr-deref and UAF reproducers, the exact
> > pre-queue cancellation matrix, and the reproducers for the earlier
> > candidate-patch regressions. I separately tested deferred giveback,
> > forced dequeue failure, and the earlier NULL-endpoint case. All of thes=
e
> > tests produced the expected results, and none of the corresponding
> > earlier failure signatures recurred.
> >
> > One small point in the ep_aio_cancel() comment: as I understand it, the
> > completion function pointer in struct kiocb is named ki_complete, which
> > is also the name I used in my previous message. I wondered whether
> > iocb->kio_complete() was intended to be iocb->ki_complete().
>
> Yes, that was simply a typo.  Thanks for spotting it.
>
> > Thank you again for updating the patch.
>
> You're welcome.  And now it's time to submit this patch.  Is it okay
> to add your Tested-by: tag?
>
> Alan Stern
