Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795385049;
	b=aWuXh4/AT6OC5miUeQa/kSir3xvqrHGeQJuCc+ghqHqLYpeI4/KpFNUbIXNjvdAeXMCF
	 RkRIQixLX/kXIRkRLlGIPqetAhtm6Ix56W3ffoIMElUtLj7iTVdgXIWi1Y6QVSbRc+lUZ
	 ynVmlihGWv/jCCUHv/DPG3Tvo6pq/ILxeupWBydsyAmtLb0JrUKYOmVAGFa3P81n1IjW8
	 DH4pP8PwoWfQ3Z3GBLmju/FvtA0T+h3BCLlT41idA1wgRbCEesUK1NCZo1KeZ2It+RY5I
	 xhq0RImLDzcsDrJcTspiQ2Oq7yngMx3tgJmSYcCpyyLWqTmV7I9hsSpTiJYx4BETXMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795385049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=e1UeqpHopmbaPkusoHxAs650nxIkw9JTuQGwP/8OHlk=;
	b=tdoeaxMUubInZvrKozVpdQ7VFfMIeAQjKI2D9V3ZCFUjXKmew1vJDJYJAAjuannCr/q+
	 Vq9dk2rhwJhN37WPfWoWBMfS55UDYzlgWlwKUhYo4nfz/JRS+HAKS4Ei5M4UN8OBKQPF/
	 pFo+NXnS0cakvfk1HsmeJPl2nnJKaSbZ4/llA23jdC6xxiIPLJH8bWFmnOSixsU9sNSSc
	 b9dRb9HVCM4ovwIfxNwygT/vLxQEj32ONI8KlRvKuFRPG+DLnI4M5PbpbEiYWSzahr6uR
	 5lpcN5eY+66W1XDVcBzYJPNvVmyv2KzyneRms7lwsvSJrV9uljD6rdBHD+++yLP0qhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Zb6i+C64;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82371606A330
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 22:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82371606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Zb6i+C64
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-55ade1de0b4so34133391cf.3
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 14:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795385048; x=1795989848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e1UeqpHopmbaPkusoHxAs650nxIkw9JTuQGwP/8OHlk=;
        b=Zb6i+C64CASN2ndqPIkyqfK6CNP07EzVS4CJfCyAslD3l9TVj2ktcjdJKiATYHCa4d
         nFzVDD4e7Fb967Zmek2vssQc1g2uGyVD924kVnth7iDDsi9vf73VQ8fDaOquRrq3yu8r
         1dlGsXvToefm0ERzK/AMbRuwle4p0pqB4q5QhtuRDBdd641tDYrgYAfSQ2/ZWtmORlT6
         EAojqrwI3sg1ialRkcqFhaHNXGMzGKS96TyGaKJzbtu95+9y6ofCZGt57p53iw6If4N/
         HS1xpGwWTuqR/vTy8cHVy92eMMwVgBa9yVwksjvyvSLVPniauCMo8Ehb6zWb1wxd1oty
         yP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795385048; x=1795989848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1UeqpHopmbaPkusoHxAs650nxIkw9JTuQGwP/8OHlk=;
        b=de7QVgPs+rsbHh11scgyBIUAiRCy+HUE9tUQlZLhnp5TdlroGOFo8xRv2Au52Gy+/j
         4sXmDrR9t8Ug5fidumE1HnrJPC7KxYDTOoXTtb8QURwNoF6mELo3OlWSCLPdg+sC+rAw
         2wScuJMMVMnBe/B6Psl87zoD/3wI7sta4glzg4j1AYaH+cts2K5L7/o+uN0c8bmV40OA
         Mkr++B0meAwQWFsGYxaEroiGW3FHOk7G25WZW8qyY6riAKn0uJATUkVrXhQgP50jOf7O
         VY8ALgdup+qVOvazDW5lBYH5oVCeNROlGC6oazVDsA8YQPtHuZO1R2YINDCumy+YrpKG
         4a1g==
X-Forwarded-Encrypted: i=1; AL+hErEihTamRQOxaelGlqUkrM7AfeM0aZomYQ21nzhVZ1vm6FTVe3rkwYFs05b1jmQihW00mzvtj1yQ5TY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HP2kRNUHoikZ4D9QsIL9X9cqCwFkEs9fZPtmlp7y2LvrWI1Ux
	J6GLM7Dc7y4CsJljRz1aVrtCVHDrGaNFbNEWhF0OPlBozMcf6RchNbjLFhIj3lCXOA==
X-Gm-Gg: AZFdTZdK9F5z/DpgHpmRujEkv2DbSuFh0OsGyeMUg713SzE1qbpqYe5OVwhMpqtApE5
	MZaWtii2/FMhPCF5U1EJX0Z1/MnqxP/dLnCInGknzSM1e28JpIqbY5d/Sa+Ck5IW7sqZeKws9ye
	Kezlew0BktHQusYxYyfW8hcEj5NNaXxEh5Vn+bfATx9qIgrKVBFQ7cgZpK7kDmuKKN/sIV0/ehy
	TrasO89/k+jtP6ZLK0UmR2J7zYYPa6XWW+7z1vUFQLKkUVXwAMQf1nH+pcMg8FeOZvmQ4Gl726b
	1wdVmsorvyqVihxJznjxdqXY0LXdFwbEoaMOZU4OKYM2nY+Dw+s63y38ly1lueSZmTtRElIaSDN
	0ZIzQDwVpG7kj8KISs9zYVqQ8U+IqPs0cF3bpPZgpOSDxlY53fcfoEJZc2pb7jvJ6Bl0GmT7/Vf
	am9S0Oa03ivkngaMMkiBRbmH0LyCy/sHbmZdEd9Y0sXcHKKyoX88xOHFbMk7spbCtR/AV4lzdrO
	qwovZBbIdjHhQWS9907Xd6/fWzOScc4/xqE1ufNL+5yf9Lv1wynpaODIc3rBpfrYCOMKFqxCT7v
	vM0SCoz0jMhVfU+8iq+vEWKbaRT4Gw==
X-Received: by 2002:a05:622a:2b49:b0:537:c478:70e6 with SMTP id d75a77b69052e-55d76ac210dmr174765381cf.36.1795385048312;
        Sun, 22 Nov 2026 14:04:08 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788ae02fsm81501311cf.29.2026.11.22.14.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 14:04:06 -0800 (PST)
Date: Sun, 22 Nov 2026 17:04:04 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Arbab Haider <arbabhaider649@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shichao Lai <shichaorai@gmail.com>, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb-storage: alauda: track media_initialized per port
Message-ID: <61e2f5db-8d78-4220-bb21-cedd9f579e8a@rowland.harvard.edu>
References: <ac19e630-f96a-4144-88dc-e3f22091c7bb@rowland.harvard.edu>
 <20261122175805.2955-2-arbabhaider649@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122175805.2955-2-arbabhaider649@gmail.com>

On Sun, Nov 22, 2026 at 10:58:05PM +0500, Arbab Haider wrote:
> On Sun, Nov 22, 2026 at 09:53:25AM -0500, Alan Stern wrote:
> > I asked because when syzbot tests a patch successfully, it provides a
> > Tested-by: tag and asks to have the tag included in the final patch
> > submission -- but you didn't do this.  Did you run the reproducer
> > locally, without using the bot?
> 
> Yes, I ran the syzbot C reproducer locally in QEMU without using syzbot.
> I also just tried sending "#syz test" to syzbot, and it replied that
> patch testing via "#syz test" is currently disabled:
> 
>   Patch testing via #syz test is temporarily disabled.
>   See https://github.com/google/syzkaller/issues/8122 for details.
> 
> Also, while checking lore.kernel.org, I noticed that syzbot previously
> posted a similar AI-generated patch from Aleksandr Nogikh on 2026-08-28
> that never received a reply.

So it did -- I completely forgot about that.  For the sake of 
thoroughness, here's a link to the old patch:

https://lore.kernel.org/linux-usb/ea864031-b1e2-4b78-ab3a-58adf681efc6@mail.kernel.org/

BTW, the two patches aren't just similar.  Apart from minor differences 
in the descriptions they are identical.

>  Please let me know if you prefer taking
> that earlier patch instead, or if this submission looks good to you.

I'll leave that decision up to Greg; he can choose whichever he prefers.  
Regardless, for both patches:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
