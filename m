Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9868719E97B
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 14:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781792690; cv=pass; b=sdWwe4+kD7uZRMAfaDNvFJaFhOGKw+YuaEbFxI7Se3h9o7H0mvU8vRYbJUUn8kT6M+Ick4Whlk74Y0CyEto6W/M1WWszHkT/p8fqsCYQY/KiFgCRmgDJJu5KNrEdhqV8c9DuYPNlEqIyrISifSytLN4kti4AqAQdlbWy1n8qILQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781792690; c=relaxed/simple;
	bh=16G6oz3qMGPw6PcK9G6FTAE8xRjtKIaLE/Wu3gkLI6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FvB4T5EZ447EIKU9Z+VpM+XEjm1vet8LaSVgut3WZhzcglZB4W4pito4+Xrn0Jdrrt3OCl0tlgtm/r3G7xsH7a++PGi53ISFM7zfJbkxANWCSXVSk+U005l1BSCADFJLsrS+UX76acZshMLIXJVl1QDpaIAbWc2cqL2L3olbzbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LtEq4BCH; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LtEq4BCH"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c03a466c96aso164220266b.3
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 07:24:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781792687; cv=none;
        d=google.com; s=arc-20240605;
        b=dDNkzadQAlMQko+twfMup4DJNC3qt5/ndPeU1cBpAtKYSA3AwcAyJ3B7+wKmNslHZL
         LDEDdQwX5pnW+Pl2Rn1/kB2yymSWhPL4SCQYeWWKeDdyK9gHxLJ7XevB0lKAUBDvLzAA
         +atXgd/r1+0H/LQ5a6tZHXl0S+q0X4dNN6ySomspbVuKl8HHtDwJYHlscY5edB7vJgpd
         UBbSYv+KeI+kNg3y5KbJ12bcjeiwltX5n56NWC01x02F9LqGz7evP0boQ+/+GMldJSzB
         9KCBbiEw+AxTbxJxbRzNmfvaHGqNy2KB36Yz48G0pfqemfEx3D56euQzb5wy4RxA1FFN
         E2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=16G6oz3qMGPw6PcK9G6FTAE8xRjtKIaLE/Wu3gkLI6g=;
        fh=u3n62/xFXcTckh7RwVk5h3h/nEHSPBR5GqCDtfbNdEs=;
        b=fRckv7J9o75dpZWTZKAP3Cnn5OTJ2t8xC7JA69wCjYt6i7P3aBkwK+0qopKqMUZp7p
         LVOB+HnfLhgvfDx50xbsxNm8efhDLRw/1ePnKB+B+V/9401crMLB2KHklysiD3GLnFAy
         5ynugzqzTj6Erh0sOeI1JODqkX2dzrBtX6gLiNZYUZqnLV+FqUdxprxcvHkhfGF5vZKM
         YUTfZZLreZHZLU9uLsy++sAIjh/PBT96GlnBbn1wvhjaXg1gr2PIrcdy2ovIqnXwbuOG
         B0T9e/iv7TdEdfJRPdjLCkGQTu0Bm3ovxMcmX5Dr4DbVYN6Bam7wWDiGGM5Ss5TO+QeQ
         AfUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781792687; x=1782397487; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=16G6oz3qMGPw6PcK9G6FTAE8xRjtKIaLE/Wu3gkLI6g=;
        b=LtEq4BCHm/besEpg/awJJx4TElNxWZFE+Sue1LszBxRydE7x5cOGoBU6SjFUcqaGXB
         AizCHjAo+ufaVI4uMISJJIx4hjYvhKpc2olCztBi4z8j+zn5jCuPM4eW0KUJ+4t5v4/Y
         qo2WxrnQ3wPE87yjWZe9LXI2mM5ojgKbm3vd7VStGc9QIChON6s2p1NcVIzijKnsTcZq
         TFE5Wb25ZS+3qTNFXrq931ye0HerRUkMp7c9ILD7PSZ21Uj7UIaPFiWIb/95j47CEvgO
         4kx5P016MLfmoJTjE3uaN94ybjOMYWWAV6BrH1IGIAOaO9KIWaMS/+WmrKoSxCCpOmsE
         I3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781792687; x=1782397487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16G6oz3qMGPw6PcK9G6FTAE8xRjtKIaLE/Wu3gkLI6g=;
        b=I+DpWY1cEK0W2KVnLIodLaGnPtricXRD0TA7GxKl6vrI7KbAKxhcmBbkEGYkYRTa83
         ZZobv5Vk+1wkYt3z6YG5VmVzuNpx/3Oyt83FsWusMU4e+2Ux6I5LGRRloHNR79SxjI4A
         jkrsSEhj4aqvVFMe2jy6Jt+TIa9YiIEpwRkYQYdcUo9eJ02wJAXLl3G8/GAV1SISUbVc
         6afMs2EaxlxfqwFK1cafv/u/zE9LseLR7dpXDtzdqBSteC8fCwI+oO/FbeJ7P/rL+v9n
         h5fM4uHqBY5Hve2bg0qnt/CWbZbKf6VRV1Io1dSIwGshESxYACjifeL3RfO+eMb5Rq8p
         +nYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9X0D92XNYzBkPf9CCjcc+jiLs+kjJIhKyXI/UmpBn6Adc3GHmwRlApsXQGQK/Z12Wry7WI8tSOBwA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz2n1e6+wC5qIvaSU4RpTQlMAUMfrhhJ6WJCYfiKpgWH4CqA/4
	pqPpTkt6B7nXL8/c/oWk5OLvmuDcXB40bxREzKW2Tp5kRF85gSX5ZjeM+LRkY/tlBw7/5GAZrW4
	r3/qQelOBUPJOj8edgfGeANf41Bz8m4E=
X-Gm-Gg: AfdE7cnX4nlNqESz+gIE/aLv46ocbp7NCTMeS5vd1QNJSaoUVI6FgIrUR7i5ce6sqcv
	4qn3NTeCmrpl6Qgbpd3uokSu5LibVFeAeRKQz9wnLLQzjn9N59Lygz9xCRDd/ohfGwLNWuywf84
	ytBRLifgbzeJoi6X7Wikwmcb+UOoVfBs/NXtGRDL2HOh40bRhexU4eDcz7USNFtpmnzELJ0MnGk
	sTqFYuV1fiovFgsHCBznoV2mkTt0l7Cfrwzto2hDtxlQFxpRp8Av57xsWYYVO0oAJlcQ2+99A==
X-Received: by 2002:a17:907:26c6:b0:bee:d554:f332 with SMTP id
 a640c23a62f3a-c07c535f7e5mr141658666b.16.1781792686752; Thu, 18 Jun 2026
 07:24:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFgddhLGHvTmRxWtguXTpgZV_Mq5ZW=CVK_ZkqbOgUF9Y5bCsA@mail.gmail.com>
 <20260531123843.736bd69a.michal.pecio@gmail.com> <3b79ba92-1c51-420b-a5d2-8a358cafdbf6@rowland.harvard.edu>
 <20260601084846.433bfc51.michal.pecio@gmail.com> <CAFgddh+dLnR=AuAU65sxqsxAgqLYX9i0OiX3Ys_sPH+YeZuHVw@mail.gmail.com>
 <20260602193047.5fe03b8d.michal.pecio@gmail.com> <49acc9dd-9d2e-4a37-9b41-de5e16445461@rowland.harvard.edu>
 <20260604125323.1bcb40d7.michal.pecio@gmail.com> <1996a7ac-2670-4124-b855-6fdf0c9999ad@rowland.harvard.edu>
 <CAFgddh+FU-8xQ850GTkxt08R8ZdAn=kfVZz7bG8-aJ47kSy1ww@mail.gmail.com> <45f91c9a-e4d5-44e3-a0d1-9727806aa00d@rowland.harvard.edu>
In-Reply-To: <45f91c9a-e4d5-44e3-a0d1-9727806aa00d@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Thu, 18 Jun 2026 19:54:34 +0530
X-Gm-Features: AVVi8CdxflyC-DuZbYbL64PSlN07yMC7g9wYHH7wyxDSrLbO-zTI6SvWhanEDHo
Message-ID: <CAFgddhLAdyoBFtQ_G0Ys4dJyaxCFAbf0G3-xSkh5ttxth-6aog@mail.gmail.com>
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org, 
	gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com, 
	sakari.ailus@linux.intel.com, katieeliu@tencent.com, 
	johannes.bruederl@gmail.com, kees@kernel.org, dengjie03@kylinos.cn, 
	limiao@kylinos.cn, wse@tuxedocomputers.com, dev@a1rm4x.com, 
	vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn, oneukum@suse.com, 
	bence98@sch.bme.hu, eeodqql09@gmail.com
Content-Type: text/plain; charset="UTF-8"

Sorry for the late reply, was occupied with my uni exams over the last 2 weeks.

Thanks for the suggestions. I have created the patch accordingly. I also ran it
through checkpatch.pl script and got rid of most warnings.

I am patching it against the usb subsystem tree maintained by Greg. Should i
use the mainline tree instead?

> Finally, since this fixes an actual bug, you should include a "Fixes:"
> tag and a "Cc: <stable@vger.kernel.org>" tag so that the patch will
> automatically be applied to the -stable kernel releases after it is
> accepted.

This does fix an actual bug, but the bug in question is long-standing linux
behavior. Since there is no regression and this has been the behavior for
entirety, is there still a need for the "Fixes:" tag? If so, should I use the
"1da177e4c3f4" commit which dates back to kernel v2.6. I have provided a
"Closes:" tag pointing to my initial email as well.

Nikhil Solanke
