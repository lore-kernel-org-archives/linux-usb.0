Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418662931CC
	for <linux-usb@vger.kernel.org>; Mon,  5 Oct 2026 04:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791174351; cv=none; b=HW8iRsJEaMyQDPBk3JjgAftOguNamRVXfzBYevXgSEgcPmo/IuQ0c30agXv8YUjtMGWRX7l9wL3s9nluM0ikyFdMy9Fh4JRaXu14t9B6xCveyXEZwnBL6FqJpBOmtqrgIdq1QypXI7wokh2sOIKjp13OyLdTQXfkOHJgRJgBErU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791174351; c=relaxed/simple;
	bh=fPZioazYkPzjSMjHIymVpmo3SG9e0aMYWmg3rnmT1X4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mH7fkGjOPFoCgCF+JZj7X+gHn79CbKpSR872jELod1d3E9sr7s1wJPIS2gXxnMBiA7mx4O1K7omvEdcYQ/6XnkqlL1Qf6NGBF3Fq7FNqcnBY1XnfpDtFCZO7e0PQL15ZvWAJnkSUGm1QDV+ppZmiGeF2dg3sOu+2HfiEKvY6MX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfGSFTxp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfGSFTxp"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so12269815e9.2
        for <linux-usb@vger.kernel.org>; Sun, 04 Oct 2026 21:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791174348; x=1791779148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=961ay0gWzbSVe8vqtS0Eg+hS7Wb99URak0c/SwD/AlI=;
        b=TfGSFTxpjxuFoUCBe1JXlOMkq5/qSH1UgON8qN8GHPWG0CY6UOHOGzYWo0B+w6BYvp
         olxZ9GQFhFvsfd8v6WgAjUhGDaeTcmPv1jCV4+FhS7QPUk8mkUFopdgtBDJmlUSxdvGJ
         jylhTYPSv0KzZY3r7NWZYIX3EgVvUALEvkkweRvtrl97yvskyT2yTr4PVSv58amIXqPa
         0H+qAMJG51O/MFy+JyGs94fb8YEpN7lWu/Am2K1HQFepvDUtOSdC9xir4FejVO1CTcv7
         5pSjwh/1eleBsJkgB8Wsa/KpsFniOOTd9ujyWtsGoNh4es8wY+brHF1PyE53+Z0ATP8e
         6+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791174348; x=1791779148;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=961ay0gWzbSVe8vqtS0Eg+hS7Wb99URak0c/SwD/AlI=;
        b=jCoQ5u+V8DQO8J7OeCKimibcwhpuPVmDWTBqU9awm4GtwSUuQTxZcSsC7iqv9JWGQv
         +JTq2ymNW18lEHmyWP3MNjpBFbjnofTC+X1ELpEQjyQmZFtH/cYLAcMWf4MERNlGbsql
         qZkHmNRqjHv7mLDT8oD4bBfzuu3M/ZiNd0R7F+U0Fi9HknNIP2XlpVGMJj0ChYvgnECI
         jUqFx4jt2XO5sWRUuSL0LwxN5ArW2lwRuOc70K7aFhkMvdfBEDiZGYdWveD1NpFGbzSO
         qgiJNhv87y56Yaxxc2KQelI8OZKns9Ty5tnCkeXnpd1RDFVOdwlZZNPco6yXWeB075x7
         yXpg==
X-Forwarded-Encrypted: i=1; AKwUvBw8VNNU4dbWB2rHf8bWV80JhoIcLuwCa0IySEzXv5ulKCYocXIAB7Rae84fs0cBx6dnikU2JqymUO4=@vger.kernel.org
X-Gm-Message-State: AFuF++kmLpo9h8FSuDp9dRn8zD1szhjJJA7uRAvwrTThrmHUJMjdP99H
	eqNXYEoPATG++J1fCrq108pRHQuR8SN29SOGHyTCu11M+qdOTtM2sE7t
X-Gm-Gg: AYBFou2p8qouSWMmnbOhQwOypmVBVt2Aht2vlkgUnj3geYuIsc6jAKCmeYiETb8Ao+1
	VcsEqJ+aHJTDnLoQf4+sOxi/4hg+TcL3lq7CKgpM64plwArK6eHm5PWPvn68saXwFRJde9lf+rt
	5IDE4rqQ6Vp24thAzZ6lG5zsl/Z2rGcgDANPTI1a5EU3QpiCK5CB5tVE/89hKQJ1m1xwbM4h+LG
	eLlk/WUWPWLR01kdHoc2lHelp5beW0/vid3JGaaw7vjULSWfdKE/bRUqxNS0DNL+/Bks6445cWS
	GP6V1zxtVT9WeMYlgaaiQPOaIT2Jwmp/X/tkC2l6rBWmd1dsHyErPSSOMtx6ASOnk2MR3p8k85g
	KvzdVq2RPu6Mf3QGZDK1VNlXXoXqI+LrYjG2uHJdJduUmICJ6EGR2Y6eJbM4FCBEIs70pRrHAhs
	KS7BJqJYHKa0BPAJ9WtZBwJdzwYOv68+A892sZ950SIeuXS8ayO/uVRt27t/ZWxxVCaiys62NnI
	k3BuIg0Q/8LG2vMAd2SG6Riz5Jc6cil28piodK5wM84GFBXdcjBthY0eX0Rb25wsorjah0mTGbw
	o0qRJzGCTEFvcC3z9yl+ojZlWr+Fbt8LIW7rb4Z8rsRnrlWz4fqp1559vsy0kf/6Ow==
X-Received: by 2002:a05:600c:b90:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a1680b5402mr109857695e9.2.1791174348517;
        Sun, 04 Oct 2026 21:25:48 -0700 (PDT)
Received: from MBP-von-Karl (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6227fa65sm869179f8f.16.2026.10.04.21.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 21:25:47 -0700 (PDT)
Date: Mon, 5 Oct 2026 06:25:46 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-usb@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: r8a66597-hcd: fix buffer overflow on odd-length
 FIFO reads
Message-ID: <asMl-yIKQoAbpwzA@gmail.com>
References: <20261002213225.27834-1-kmehltretter@gmail.com>
 <CAMuHMdWEYkBra+3G_+-TfT23BAWPxG5o2KHqGRuHcdp8x0Vskg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWEYkBra+3G_+-TfT23BAWPxG5o2KHqGRuHcdp8x0Vskg@mail.gmail.com>

Hi Geert,

On Sat, Oct 03, 2026 at 02:42:48PM +0100, Geert Uytterhoeven wrote:
> > +               count = len / 2;
> > +               ioread16_rep(fifoaddr, buf, count);
> 
> Or just:
> 
>     ioread16_rep(fifoaddr, buf, len / 2);
> 
> > +
> > +               if (len & 0x00000001) {
> 
> "len & 1"?
> 

Thanks for suggesting that! I will use len / 2 and len & 1, and a
plain byte store instead of the memcpy().

> 
> Seriously: a *_rep() function for a single iteration?
> 

I'd like to keep this one. ioread16_rep() does not byte swap.
ioread16() goes through readw(), which swaps on big endian on most
architectures.

The words before the last one are read with ioread16_rep(), so reading
the last word the same way puts its first FIFO byte first in memory on
every architecture.

Thanks,
Karl
