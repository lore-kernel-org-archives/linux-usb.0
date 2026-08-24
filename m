Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7643E7BB4
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 07:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787555102; cv=none; b=PuTOfAURsEEMvlzlwiuKD3Dy9ElmO5R+NGjBmU9JdppGylSPRPCa8VWks4DmrrunWucal1W/ISQwZSc/PS0a/OGTmcbi/bZNSgUJNVTisQdB9a/0K7UkJfbdsq3JQ8zB8J/gdtlls/Kutgw/LICDHnoZMPS2Zlz8eaXSezckL7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787555102; c=relaxed/simple;
	bh=xKN32E8wLrGaj6tmjPfl/P0+ZReo9n7gatHe6sVolhM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G0fWs+2CrMbfAkAXgN+CG+HPt9QBbIVdBf4aUpyTqTLo7heMZHNOAlRLLcyPMTjKI4tGQseM7jvJL2/Xrbotr0joKuORM4nQ73LBBdUV4YKvs2ftMHj0FbuPRJuKC+MFg/ymRKtwKWH4bPL9cfXc83pTiNBXajnO151Wn6j40q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oeJLgq87; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oeJLgq87"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1670dad7a8so541042366b.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 00:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787555099; x=1788159899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bWqpwRTrm4M/tFo9Ly0UzSIZHyCLcpA9GaYDfH6fsDU=;
        b=oeJLgq87YlfssqrJx0sC58jvhsSJiC6070miWDMqBr4gZxyftOWYZT+TubK1qwfJ8+
         9bRtCPw+SjhXsnXK3Jh6jboFVAzCphLEFWeZsNdd0OfDNuviuJamspXkOuctJTuP7IlT
         5DkWERFTJrn1kDicoV6mGPGjQq5ZFaPx4U2D9Qe7SgKkc9FMadj4tTH//jZSD2/vxB1K
         YZn+rEhUAI/r0ryVG4VMwmGXLWbq3NqMteR+g+sWa5YoNlD3CxDl0asbPVKZURW+jDa0
         poJOYw71vHGX+i6LRVJd2+xJodlavwOPoJTrJUMu513CMIJM7I+zQRcrXja09Use1aGt
         h2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787555099; x=1788159899;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWqpwRTrm4M/tFo9Ly0UzSIZHyCLcpA9GaYDfH6fsDU=;
        b=UYQCQHCIaM4rZJN2R7CebtuZFTqYH/rlva8BGXBdN9FVV+u1synZh8QOvNykfz2eAu
         hH+K5EAhxIyaLeKN9aVEitbsVh/soIHFoR/Mo18Clpo1HlR1WbaK6IEzL8OC19DL+sti
         V3aqaAXJjFXorYFgDWXAcfyBazeMfB6VxZGdmlcwPv0+Z+pZ0GX5/KFpD2PABXthrsma
         b8zqX9HNPROJFYh2F3Yhd5/iKpFtZwLoeT/ZPD3VGjiNOg/Q2kexlNff1L42EGYM5DyZ
         o+C78xZgyz6MNPc79847qZP8YnyhEic2Vg5BJ6pS28QbbkG8mOL4LVsoVCwW4tO4J9pp
         V7Mw==
X-Forwarded-Encrypted: i=1; AHgh+Rqf5Yjc/ooKlfJvtY9VKzsvNWr7Eic8BetUAAEBv0lzagh2twPdhL+06lhncdPtSMqvl7tzugv0RgQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kkhLwhLqNECtGsd6ItQjZDauRqYhwXT0lVXXxZmb8b+XDK7Bhn
	omWycnzHxhHPZAyb+6eoxzCrw4JPnMef+mJpUySn5R3UjE3jQd6u14UC
X-Gm-Gg: AR+sD10ZvFU0MbqI1gi9kQMLQS8BZaz7BmmOUYAhZ/HgPtOLI+btCAhuFXjygT7Yoen
	XTVWONHr4f27Yz6Tc8uoDsRH6468yAVGNHo1o5UJnoprXDy645O1sxY4fNCYeAzOL5zDluJNR33
	t5SuDh6Tqqk2Af/SJVPdYBcsI/RkDWeAqbATGWaxYBBQ0+yws/or2mzA5A12IY+HSAHVh+PJTGm
	wyVu38e1KppGcqPl83iW4W0IVq0yi9R6HpZM4o9ghbyVkOSQKHZgpFFNevkqowN1tVICJ5jlkYm
	N7XUlseXzFKq1QTDM7MFm90eXXdSELiJzOxznv7XmrnwKcmXc7tUI60ZVy2Iq3HJJRd1Y0Objk3
	rhJpZV94+BJKl8pm5fJIakVikP1uHogyWMn+qAQe51u/BeX58qsGgCHnVr6PBnMHuR0vRwlwGEm
	iqNF28dBjMSrL9rfxGzUBXpctsgcNt+IYwE96MOBPXJhG/coa8vnXL94RYLt/NCpUZnQRW3fdac
	a57xcOQG3I4NUZNBUhQHIgmkjPw6J7zWdVTRkYqnIuGKG8ULCQICg8PNO45qq76drWy/UX1hRHq
	rIXN/LodANUHJN7kdbNPM1Nu9usMXH3yg34GyThmVYL81xTEUDmmxLFlQmH6Cb7+mZCBpybgq+F
	pxEWvLcDTVklJDjcdanVolctbghswiWxpFtZYOfK6bxXR+4o7p71Sls/1uGcj1JD6EY6FyA==
X-Received: by 2002:a17:906:fe03:b0:c16:242a:472f with SMTP id a640c23a62f3a-c246b4af7e1mr3109366466b.23.1787555098709;
        Mon, 24 Aug 2026 00:04:58 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685c573sm1361238166b.51.2026.08.24.00.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:04:58 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:04:56 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+6c7e68b141ebd3a2cadf@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: typec: stusb160x: add missing NULL check for
 i2c_get_match_data()
Message-ID: <20260824090456.00006dba@gmail.com>
In-Reply-To: <aovpOp4QunPBx-XT@ashevche-desk.local>
References: <20260806084301.1340-1-joshua.crofts1@gmail.com>
	<20260824084041.0000295f@gmail.com>
	<aovpOp4QunPBx-XT@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Aug 2026 09:48:26 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Aug 24, 2026 at 08:40:41AM +0200, Joshua Crofts wrote:
> > On Thu,  6 Aug 2026 08:43:01 +0000
> > Joshua Crofts <joshua.crofts1@gmail.com> wrote:  
> 
> ...
> 
> > >  	regmap_config = i2c_get_match_data(client);
> > > +	if (!regmap_config)
> > > +		return -ENODEV;  
> 
> Return -ENODATA here, it will distinguish better in case of debugging.

Yep, this was before our discussion about this in IIO :)

-- 
Kind regards,
Joshua Crofts
