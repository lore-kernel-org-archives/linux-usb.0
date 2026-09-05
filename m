Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D452F377ECF
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 08:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788597819; cv=none; b=KFEvrp2fNy7MIQ1PODovUp3E4+XHqYbqwAPkjBojC0C33MaXxWwgRHcq2uj70EosqQ0ITLkFQAf9IoDOYWhmf8j5S9HI+UWP5qBNlNBx1IXNipxHTTbI9eJhBwOOnUmQwTslgpfh4QpFY0iKRVMT5c4dP+Q5BoRReFfYwrwwDu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788597819; c=relaxed/simple;
	bh=C4QJnvpWviAcO8fJI1TvitJRhstNdkSkmmP/2zmlvss=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BuUshwJLd+dKoz+9/W82cBQyuNvrCKfg3mKnmMyyY2prIueZUGyMYzOxj022jruhH2nQKazi/wOJd/zauaTQPVrbIjoscL0td7jVAeDsKnKER/1kbY6MIq2UeNv9XbebYMfmfaxaSuaHe1HLBEoHF2joufmV5kvP7W85Z4KDNYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T80EanUU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T80EanUU"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so16439475e9.3
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 01:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788597816; x=1789202616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Akhb3CN3A6SrVcr0STO3cx8cdsASy5+A2+rjuvgdbv4=;
        b=T80EanUUUIWZ4ugRBS7SdvTQenfAi0diUS5BsU/dzNqbHqybGlR80UYvTbma5xVrno
         gjtz4GzeJXpJ00lZ4GywYs64gdJtVcBOMnMYiZ4SykQPk2fD3KIb3KoUhlDBmiYfG3uu
         IMo9Pt33LIIDJertj7zQFmo+bSlePfrI9re3gwnZi599Eh/wDpkiibQFyiBv6p0YxVyF
         n+oSPEkys3IK0NglAGUbXolf2PSUB8T5gpDcbDQnTNzLW22gKAjNjEM3fntoNF4L7nC+
         XUFwOev9b4XyOF7X/rkw7BROtoNLrptEKO1U7GcmFhpaiapwgkvqI5cD7JKAFYU5ytK8
         4y+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788597816; x=1789202616;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Akhb3CN3A6SrVcr0STO3cx8cdsASy5+A2+rjuvgdbv4=;
        b=WVV+YLIX7EbLaYcA5D/JRSqbzqMUSjWYY6csdW7OPQM/l0yS5hha98Vnt1Ll3C7Yk+
         0U6LP+Bh2tvDaVOzNOuXcITiI6N7ISuIrBOwuWXaVbGYPA9++rGeF3OVlZxIOoZVXN+C
         2sVPXBCOKIel3izbX/lty7+AtwG9KinMPTj8p5ee3udCc2EKkAVpGbnPBkpIj4FNeVSF
         g4P4BQ0V2+AxG67RcjXfImna/F457b9ShJUAz6eiPaR+osu2PEOLxqGgpFKT8wKQhGRO
         Gk4S4iFmIQPDHu72gvy3B8/B+1TeivTvmB36dF24xvVV5MP+amwG+KLlz/5AywLesEjU
         Nrbg==
X-Forwarded-Encrypted: i=1; AKwUvBx5Zezk5bavNcaaRI8mPDu7uvKRRkiT658CprcwbS2C8Gh3CdfBHnmeAOLSKDiixFk0O88K0dfZgsc=@vger.kernel.org
X-Gm-Message-State: AFuF++kofvctep/3q4bh65rdPYswKsslgPG9sbAE2vrZJAPRe1kpEjRb
	YSTAzWxMWVr/PIgBZZR7NH9FdbhLme2A6LitUs5ybpwiwbGj1M53PJ/t4KtHkA==
X-Gm-Gg: AYBFou3AT2j65PSA65p+IuMtohl3KwHAaZeokYoWvrgMAdTK9o7zpQvW6u8g+25SQSn
	R2x+mhS+6WLS7Vgafb/93R19hYKTwUETe6W+5EMJwXQTCuYRJjmmXnf3w7+h6lpcniykYRIavo5
	tQFVJ7tgq73AIhfkH7z5ntzb23JhiQjj+MekB0lqyNgCELZak47dp7YSI7WLmGOUi+/AWsOCMfD
	hdgRmbHqf6sFTQBdIhzwmpZsdrcvGwH4eHmSor2oZGpw8+DjzKE8rViK6KAHdLuv8OoSGhz05O9
	Jtr7BeQxircKJscZUV1W7/qgwPNebWaMAkLiJ0dl5LF068vXXflFPQhU7fnipOqBvWI3P7L5eOs
	x8dVAXaVtqexnEH46xOWLnUaJbWiU6vHAxt8OYMS605492jhl9Rfp0W8NSHQdXrw2S+jH8Pf+f+
	myE3my6ByHkgjE2WtN5ZrT/xY8xhlpxlvI5E59XA8+LgVkcBa93wbxvNBwDN+gouOdMTVW1w==
X-Received: by 2002:a05:600c:3507:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-49cf7fe6900mr192812715e9.3.1788597815955;
        Sat, 05 Sep 2026 01:43:35 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm93253635e9.3.2026.09.05.01.43.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 05 Sep 2026 01:43:35 -0700 (PDT)
Date: Sat, 5 Sep 2026 10:43:31 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: syzbot <syzbot+7300affe388249d66dfe@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, shuah@kernel.org,
 syzkaller-bugs@googlegroups.com, valentina.manea.m@gmail.com,
 syzkaller@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in vhci_hcd_probe
Message-ID: <20260905104331.6d4288df.michal.pecio@gmail.com>
In-Reply-To: <6a9bceeb.a5e650b3.26d8a.0008.GAE@google.com>
References: <6a88066b.ae6ddae5.3da009.002d.GAE@google.com>
	<6a9bceeb.a5e650b3.26d8a.0008.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 05 Sep 2026 01:12:27 -0700, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    9d80aa4617b3 Add linux-next specific files for 20260903
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=10adf4f9580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=bb4a32c282cc2ec7
> dashboard link: https://syzkaller.appspot.com/bug?extid=7300affe388249d66dfe
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=121c7215580000

Who or what is coming up with these ideas and even commenting it?

    // Iterate platform devices
    dir = opendir("/sys/bus/platform/devices/");

    while ((ent = readdir(dir)) != NULL) {

        // Set driver override
        snprintf(path, sizeof(path), "/sys/bus/platform/devices/%s/driver_override", ent->d_name);
        fd = open(path, O_WRONLY);

        // Bind to vhci_hcd
        fd = open("/sys/bus/platform/drivers/vhci_hcd/bind", O_WRONLY);
