Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E063D9DAA
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747741; cv=none; b=UGbkKJDkFFmy84i0kjcSjD1doKHEsE8QYfNkdP+2ZJVrieOsojjxMI3AkIBu/D+FlsHvULY7O+i3XLrMOLlEhqyjMvpa7bZJsr8Zi7ismR1euIPcFqvkMz3eGFZKWc9OcOemWdeLjZsQtyecfpdTzuGrnhJ4gwSRlqQW10SSkWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747741; c=relaxed/simple;
	bh=VjrLxq41uw4BiWdFbGzXauFX3ga0sq0gdX7yYyoSq50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sG++9s7QWLdFwnCxqMBlXRBhybXy8b8g2Zonw+sxjusi9YQUsZCFJYm9XNYGVB2a5lFjnoMFem8JBrqwFhjWgS6yot+xzSYn6HO1KBGtieWdj+iK0EZKtvTPaPLzrStnqbs7imnP4yI5af7mszA7CC+kOVgR90VKI0CthqbyAZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhesQrLX; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhesQrLX"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7f48c750afcso931343a34.0
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 05:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747739; x=1788352539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VjrLxq41uw4BiWdFbGzXauFX3ga0sq0gdX7yYyoSq50=;
        b=dhesQrLXb9fihi+n8MxxbAcAs/a1aOnOA32/+Jp7NuKM4v+DuVroRc/w6fM05YuwSL
         fdRCHXS78CeY5qKCRky9pgKtm8YcqUzGaHxac2Hn0i34BZL0Rvj8M+FBBlxGHwjBQbQ5
         wnbfisQtWC1cz2xWD8uwjlEkC3e0+7PQOsDStaeNeDLHEet0qejvndPH/obYvukGETOE
         53vdn0/OT26EKUuzBRavr/6ON4ivOrzVFLAIkMmdmPDVPyKQPyyqVDw6RnDFZmZ2z7ds
         C/peSkruINVEjpaU8VlvEgFgwHxB7iB2L76E829+iXIEVLlKtRiNg1n1DLfe7PavkmJi
         Vyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747739; x=1788352539;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjrLxq41uw4BiWdFbGzXauFX3ga0sq0gdX7yYyoSq50=;
        b=VVb/T6AMVXgvMj/ksrDorLtOclKV9HrdW7gzavspWPKIzjl4jYaVnytK0AJrljVtS2
         Yp7IEOg88/FwIAbxrnvSHGakmwtaot6ibh0UJ18zaBTGa7jBK/35e/Svy0py1JPYnHI4
         qrwAt2ojUcd34BwnMR+fDRGLQwbhOMoIbEfjdUE+WcdbDvY0tNePegKWyNC5T/7hoYjR
         ms2K1theE52rGFo87/1dnJ2tf9Q+NilGI7Cn5KAfEjZTlqXJvw9EID5rHwoMnVNjsL/Q
         dsYbbDwURGv1F3a9iGW1RO1EVdRqxdtVv9TqqyA9SJx7lNjsbGlThiFST2aaDH7W4CJ7
         d8lg==
X-Forwarded-Encrypted: i=1; AHgh+RqwBs66fe9hWsPmHzyZtoUgoNGhCOQPyIIYvSuWPFQUzCtoHvFQid5BtPzOWuut7L13RtlW4Mlc7RQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nd5xUoQ3GM4TNqbbwso1JkfSTlvGEXM1rAdDTWBrOL5A9/MBkp
	tjQSlw2Z1Pxl6vIcM17Czjb1IpkfKFiYW49LCv4JYofjMYzrbZnN9mLe
X-Gm-Gg: AR+sD121vfQkdezUIEmV9cscpmhHfDa/Y1UY5eH8X4nqgtB4J6aZDBRf0qIwKJMw8nG
	QTe8qNZY9FOkjtTiocv45PZaN34weNR8DS+BBqBIa3INuRfQ/5d1ClP4xnXv+IedrGFpSMOgG7T
	QunFYEuKW1AKnLsET0fl3J4zSqVou/n2AcxGxrkjGM69I0U2vf4QBLkXBlJUWt7GRPSh5SLAs90
	L/9Jm7wf6ppqQrA5Qz0N4AWcAn2QVH1j8uVqqDhAnsrBjm7n5QDHF/IYg0b+226+noInm3hi/tH
	q8Cp356gRVPbidwPab8AscZoIKgEojnPrajV7yl9SXbUL7nmXbjcuiVXLQCP/THcNRUqDW6KA7q
	ImP4os2NXDK2gW/5BM5VN/C6cIY58YKW6jght28NK81ur5lPtdZEZXmDqO4yMuZBXxviGn3Q+Iv
	Vl0sjuJlA1NXbYaZa6N7NzyFzc3tjonZLNIY+RlFHt2PyFn4CDcWLkeH0BaQO+XT0fhqcLcZCPn
	p5u7da5Bdllmco4/Gbi2ESN5eLDwQ==
X-Received: by 2002:a4a:ee0e:0:b0:6b0:4170:59ae with SMTP id 006d021491bc7-6b1a04ffdd4mr5407369eaf.27.1787747738713;
        Wed, 26 Aug 2026 05:35:38 -0700 (PDT)
Received: from localhost ([2409:40c4:3158:4e86:efde:1f4:fc9e:35b6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eefd98sm14998290c88.3.2026.08.26.05.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:35:37 -0700 (PDT)
Date: Wed, 26 Aug 2026 18:05:34 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Mathias Nyman <mathias.nyman@linux.intel.com>, 
	linux-usb@vger.kernel.org, regressions@lists.linux.dev, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
	Forest <forestix@gaga.casa>, Slavik Dev <developer.slavik@gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
Message-ID: <ao7aLXk9q_v_jEyX@eggarch>
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
 <CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
 <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
 <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>
 <aosGtkE_diwVJJtB@eggarch>
 <20260823174059.46fec036.michal.pecio@gmail.com>
 <aoser8dLytrwqBC2@eggarch>
 <CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com>
 <ao1ovvdPAy6n_F7I@eggarch>
 <CAPyJwA-QALkCQn8J1+=U-nuE_7WSEPhVcUEKb+MMYMaA_1AVjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPyJwA-QALkCQn8J1+=U-nuE_7WSEPhVcUEKb+MMYMaA_1AVjQ@mail.gmail.com>

On Tue, Aug 25, 2026 at 11:43:22PM +0200, Mathieu Fluhr wrote:
> The patch you sent makes the issue go away. I am now running the exact same
> scenario for 2 hours, without any crash.
That's good, thanks for confirming.

> However, I am not sure if this can qualify for a proper fix, since I
> do not have any
> external hub connected to my motherboard: All my USB devices are directly
> plugged into root hubs (and at the moment, there is only a keyboard and a
> mouse).
Yeah that's the point it only skips the 200ms hold for root hubs. The
external hubs still get their fair hold since a parent exists for them.
So external hubs are completely unaffected by this patch.

On 'proper fix', I think it is, even if we keep this bug seperate for a
moment, it makes sense to not give root hubs hold they don't need.

I'd love to hear more thoughts on the patch.

Regards,
Lovekesh
