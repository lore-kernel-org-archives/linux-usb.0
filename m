Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD34B41A504
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 05:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788498762; cv=pass; b=TqiCU5SzKs90OVE5UgNCwF9EVjzQZJf7DReosWq3FA/kx1pwefpQF9nZ1LV20m5FHjllkovKoYz/8GpPn6HjXHk0XVwimwexzCKD+Qxxqb0eA8HTpCYih94HVIFsKowfdxANZhQph0+gYOkq+kuygglTYN6UhDF10HI6dulkbtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788498762; c=relaxed/simple;
	bh=6WveVFYX9QpyiA+QgSDLEf2RjnyJ7y5v4ciIKEpCkN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OmEcfFFieYacltoFSy3Uud8ckf4Lbeg/xPfntHWgOZA9rEv4t+Zgde22ZcYqPbzbGfQIIK30BXAeYqpWRSalTYzX0d+KJePZXQBS6eQXr76XigMEltQVfpt9QZFq10jk/efjN722L141+7kMLx7uLTHwYtd1+BYvm3oQc9LWZjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mS+pVSU/; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mS+pVSU/"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso635187a34.3
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 22:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788498758; cv=none;
        d=google.com; s=arc-20260327;
        b=hvN0q8BLMMmfusib45zW3thrIs4Hm4q//3eGJpQxjK4iklx0aqwBZKbN+RWTt/gjxZ
         Iz3MatxN7X6LDT+vW8P0IGcaBEnUDlV6OB/wAQplGrhWFyKB6nTVdGwPSCHIbIERXULE
         gOPTMquqx1zOjlBKnT0Hvfua31q2SA5YqcNEbZdSZi4jsEGpbtF+/8n+feG5rL2yCJFQ
         ijxfFDe+z9sNDuga1DIf2tC9krQjZTmNsbiI7KscEQ+lRgaQ6Nv5wiuJBAQLImJSiwFE
         hhWgl2I4XMnq5nQPSN/xz02e/90hyVO10OPXwZwzL3KHMb6/3oHVUwZXrDArfeHcEakO
         N1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dxBBEpiO4i6retM/Nk4A5bzdXUX6zMxq9qRuaBUkcIs=;
        fh=2KlXw3pthxkUNwrnwmBFg7curnHK2OtMzqaqwQqvrFg=;
        b=T1VxLwovqT67ifGgoB4WAfjuDPHvT2SI8s/s2gFv7X/eRvjn48ODftA+uJulsMwiBF
         3OYI7jNlGA2jj7BmSJV+Tq+al22E7Q5NhEFe2m5VgLwdK0djQwG1qpIk51/noIDZVNf5
         vFJxJnSzg3x7DXh0+Sy+IsfD06psmbDfuBtUjdmMd1/rHatiUrLCnHQ41ak3d0Vs/5W6
         XP7137PcK5kxrdyouZWzaMs5Zj/hQZ55DcykYYzl8uktvdR6W8g2lBI4Dqm1chxzjS1M
         vnNptZ1Z4dmvhBqf3/1bGzAiwUNYaVfTkOT2McFGYbHZr09Dzmiyd5EMWI7U8ozd9trN
         NC8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788498758; x=1789103558; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxBBEpiO4i6retM/Nk4A5bzdXUX6zMxq9qRuaBUkcIs=;
        b=mS+pVSU/UFZc0YC/eU5rRSWERtRgtYA/94QZJHdpN4fYlOJ/t5TejoiIBP9zgJXpH+
         L1yIwHo8863kLUTwBsguFy2A9emelDktw+kdR2MPGcKI4ETc4zIEywVt6S8Vp4tkQBEB
         LUFRcwavfIwfAOZjmHLViTpCN1vw9Jx6YQdeRD9JZbIf1wTZoPHS249gQGyiet9bnx2f
         AKWwB5gJP0HqgnhbKVDc1UzIJAtYst8sIvY9O9C4QC4uuCFUVWntN7ziGs+I+CSc5utp
         s/Z50lxD909UzUN8yfq6hnH65VAg9aD1XOpDVEYHqR0CzNZyhDREATzNNtIGApCof8I3
         BWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788498758; x=1789103558;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dxBBEpiO4i6retM/Nk4A5bzdXUX6zMxq9qRuaBUkcIs=;
        b=GtmIPQPYrE94qLmuVCjdbRNljwwXozGVVRAn0jXv61TV62qASuLgf13pNiw2oAlVda
         +Km93rVsVShsABksqkmZqq5ZzPM82DfyyVXo8VwMqsmDGT0Cb3+jLgyCZAjiEH94jLZ0
         KvLSlD2YGPgT6U4CYOL0o2rIh6UDj6AZYHmmP9tvukmVfntC0tYcttHF7fEHWI1Nj1ls
         1byza4tCGLWPWIph7uqFJ/92KnDJZmtv4GPJNMWx7iNXulZ8l8FvDy0ugsWLHRPaiF7l
         V4HvidhyyiRuoXdNNlC19glHF2fgsEf3P/6n1eVHQjCRsJCcQ8CdH7jw+UA5boDL5hy8
         oXeg==
X-Forwarded-Encrypted: i=1; AKwUvBwmGQQwdKTE3LHNmh28zjn25CJeDjvhJDY0THzyVU2+y24zdWMjAqJD7WVTTbUxYm0MY7sibTL+yKM=@vger.kernel.org
X-Gm-Message-State: AFuF++lVP1dcTcF4Aku772gaVVVeKbd8eDM/ytdCMI5WcYmmz7/MTC7E
	LFBsm8UMA83Eq5Prv5gYyby2meRH4+t9fsIsRoXjz6zcwI23VdnaxReVm8qXrhpEzJdKrcVwKRt
	rUvtsTnDOvERZ6yDbib5rmyUVtctdzbo=
X-Gm-Gg: AYBFou2kX06w5ySu8tWw50g2gui7SMMrjG0wliPqGXh7vjMY7+PUWnmqWFwkdwrP9wp
	dpz7oy7DRB4by8oE2nz61qebIdkE7OWXvFtxB/yBj0dswLsXXrihZ0BOkgcidRddeD57Afeowf+
	FldaEtNOD5LOPqb7F3yxMsC16UmEbtlgCHq0WsSvxH4diExgaA8uhG5ySlMUvXUwf+wyLxEDs2B
	C6oDU1TrqeA9bxsjd14FoQKnu3NuBeHG8iHT+6UEXygII58gShtlK8XPUIABhNYwJywypNOL+Va
	ChRxG0pCjt6S5AkuKQErL1H1CFtWokPGsWlZSbNSksSDn9vL+ONHvf8nn8K3l+8ZSbTt7Iu2qSe
	NxA==
X-Received: by 2002:a05:6820:81d8:b0:6b1:3db9:b758 with SMTP id
 006d021491bc7-6b6fb3d2f3emr2725515eaf.9.1788498758385; Thu, 03 Sep 2026
 22:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902050127.3767049-1-rafad900@gmail.com> <b99e8d15-9031-4d77-b1c1-2bd8cce6013e@rowland.harvard.edu>
 <CALp66yF0MZy9UKo_qGGeekxV0RNMNKZ_foqADVnqg+_YgEYqEA@mail.gmail.com> <de10753c-7504-4b55-b08b-cc8b91cd6711@rowland.harvard.edu>
In-Reply-To: <de10753c-7504-4b55-b08b-cc8b91cd6711@rowland.harvard.edu>
From: =?UTF-8?Q?Rafael_Alejandro_D=C3=ADaz_Cruz?= <rafad900@gmail.com>
Date: Thu, 3 Sep 2026 22:12:27 -0700
X-Gm-Features: AcwNN1WSMUq078TpF_DMpnvROz7RxjYdfagzJv4R9tDA_b0yZyXK_kH6J5oLoVI
Message-ID: <CALp66yHc7e7QYxNhKy_zMHe7gV=KrCexu0vB+AuStCWOM3D8hg@mail.gmail.com>
Subject: Re: [PATCH usb-next v1] USB: gadget: Fix UAF in gadgetfs_fill_super()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Which changes? Currently I'm on the new v1 and all I would do
is remove the top paragraph you said was unnecessary. Or do
you mean add the "Reviewed-by" tag that you added? (Thanks btw!)

I'm not sure either about adding it below the "---" line.
I haven't done that before....

I saw an example from some other patches and I guess I would
do the following:

 20 Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
 21 Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
 22 Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
 23 ---                                                      // ADD
THE PART BETWEEN THE "---" ?
 24 v2
 25 - Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
 26 ---
 27  drivers/usb/gadget/legacy/inode.c | 1 +
 28  1 file changed, 1 insertion(+)
 29
 30 diff --git a/drivers/usb

Is this correct?
