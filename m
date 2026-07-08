Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA4B24293C
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 18:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783533871; cv=pass; b=fFmolyEENBYF8a/cvv94CGmjJsubKdBAIq938pZfn+hNsDW/JjPUwXwDCbsWgYtJzW8dhKmkdFqphi6hHjI3zfVRw/OCIcGBGhOgOYV/6oduN10AUD222H/f14D7/FcSH4XXZQlyhgUF7SMPMqFdRS3oEoW6f61dtnxcUCsMeTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783533871; c=relaxed/simple;
	bh=wFCc6N6gv27PEDI1TM3yV/n4BK5kIMxvh4CPbAovGEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HNs2a/OCTk08j6vPB/rGTWcFvL1x4XDhrnMZwEyax3Lh043ZBjNFsGaGzXREhdfVQpVfQvUTdja4YbCX+mchZbebS2RbL8qKK/QJZWywrR5yK8MDifygeqDvBxvFv+U9hzsWtwuSV8cX481gHj79IigpdH/0fM+uStz5keLbkzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oXjx+hxY; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oXjx+hxY"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c0ecfaee7so5813771cf.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2026 11:04:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783533869; cv=none;
        d=google.com; s=arc-20260327;
        b=LMxMLmV+OrrCRQeP/dKYUx1MYHp4f9LMUKQeW1hOvlbm7ar+Y6zEPoEW7YBngRGRej
         SiZ+CZxwwg76LSsJBn5sh2/GcghFz7UmPgVgJ8eSi/NLbR07BjOZiNIZVhmRCeMCcJSu
         LDjzwCwKE65sjUNMzgt2yOtkMY8FZYIBUALSQTpnZUt/esvSdhdxWHOmj/vXmfiD9ugl
         rs3xBsg2oVldAOa1cRz2z9KPb4ZeBkTAD32NdI0wSCuAiGvsXiamWorclj7QaY6Q5yOk
         XWdTIjURcgtkA9NvUCSYbqSM2UuO4NmrXTIb77oJfw1bVlGqromemhOTqa7psuEBMXok
         Qm9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wFCc6N6gv27PEDI1TM3yV/n4BK5kIMxvh4CPbAovGEI=;
        fh=nehm0p51kVHxZo4qAvE4D675Whk49ZqK/HkYABckHgc=;
        b=fSApLxfM991H4EA3yzY4Cf6ZeUS5uHh7+gsvi9BYt9DvRl6PpscpITfH830wEXCK5n
         niYkW813k9g+O+kAisYEE01D1P/s2Lcc5fkbKjjZucVGL6UHYEYwCggAKnvf+X0f/kjy
         eu1FdNwpdZ9++hu2EsPaE1QpeKTMSrsdbiZlw5TEPeWrBDVkeMIAyF5FvljxcOBKLbJN
         KUe768w3jmsIqOMnf8WIXTnpsclPK3b5GW23CYf6qLoTJRMiegIx2bRzsoSvv4q3mZuv
         8gnUdEt3snCvXZME4JyviSTWyAq0EEVwLgjo84cH1ZJvX57Mqv2ISmv1/uhXUsjKa3li
         Unng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783533869; x=1784138669; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wFCc6N6gv27PEDI1TM3yV/n4BK5kIMxvh4CPbAovGEI=;
        b=oXjx+hxYV3DSOBj4Xx8Bo9kdT5XW4Qt8fYP85BgSqLpaOH8NQGkaE3l4mqZZ+tpuo9
         hMHfceF/CZjE0ios7GChz/0I+PuPnyCQSD2YGAwIgzlX6+/P55v2zMuAtTl4jrxL6wHk
         KA8TqKk4mNLOD6cgu0rJxlr3sp/PnefCb/gcjMllQMhRq3cUWH2MSS0YNiYCWVVR/B29
         IMh57ff73hq7Ypduc2pxLAvzmX4vr3536Ypom//YIbfDPR8GomEpitx5BvA3bVwqRnvz
         S9Bgns3gOPCXftZCtV6AJp5zzbTlzVZRsl6FuIrRW+aSflo9hlED+K4iz2VvGAlVXHUM
         Od9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783533869; x=1784138669;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wFCc6N6gv27PEDI1TM3yV/n4BK5kIMxvh4CPbAovGEI=;
        b=YoQb32DwRj9A3ilyNXF+9mG9VYghqLE3Hiknp/k7SCWSKKjz2syowOaatvxKIu7uWK
         x9VZHTZcOqhrJ4xad9rI5CYJL9+FX0Mav0+fQxQZhZyTB4T3RuoOUbhC6tSIblHr+4G5
         /d7vAQ6fDSDBkPYytju4V7/5dg93avvrW0MAhlOBX+/K2SixjLnLnaGuklCOhNGJRHQS
         r/om4kW3GzLfr6/6/wI3G9aaDCbqikmklQa6GCpWeVhVpaSjo61Js0xpfQ4rhJTpDXeu
         0KjQVw3BZorF6v8nhvXAp4hDsBjWSvk5QskADi6GEIkXjZaWZjWCarmonvY6SkfQnMgC
         Pl8A==
X-Forwarded-Encrypted: i=1; AHgh+RpHwqRPdW3B7VqLVdw4+jpk3R3oSxEa/gaFSXmQ666nVf6rPJKe1fXxETim4XzHnbuXMKNo91i5AnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSOqVlpTeK9t4WFMNMpKFIykfB2lyIsJjUBYXGP+NWk5eLMlEK
	u7HIN1Zqh4S9ffLrYg1SkcbNXc++6KdDWthWlmUtHjifr+iS32R6CHcYPCmshbM4ideYtsiW1Bi
	pAGvEd/M4MTKUNXBhHf47dtSSMgk7zds=
X-Gm-Gg: AfdE7clbEHJUKKvFZa4V/zQXH14Aqnt8xpSauKhXF+ZnivE5cLfFITnIECTMqlWegRa
	YtrzqohPL5Y+Q5Y3ob0q/ot8dolhupeFggWQajkBF6zEX31sdFihXcUI1TnavLE8KjLuP2uQLvB
	joicpja5tefQ8j5RHP6j7eDUUNH1oDCgxFzt+SPVpBpnj4nMrvZ8CfHi7eBxC0FFQCydok5Nomx
	Aezk6dg7gtJjWveza1hScAVEBkmeyES8Nq+4/eigpDo5WL5AZvWn/5Kzzn8iRwi5vQVA0YcCMYj
	+0NTOBqo3UrcmOE3FbfsOlNP1lHl2A==
X-Received: by 2002:a05:622a:1349:b0:51b:ec34:292 with SMTP id
 d75a77b69052e-51c8b54a8eamr39514631cf.53.1783533869049; Wed, 08 Jul 2026
 11:04:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618203053.4725-1-iganschel@gmail.com> <2026070835-thorn-doable-8c28@gregkh>
In-Reply-To: <2026070835-thorn-doable-8c28@gregkh>
From: Keshav Verma <iganschel@gmail.com>
Date: Wed, 8 Jul 2026 23:34:17 +0530
X-Gm-Features: AVVi8CejJkU8lTi8KMWLMDulBjPqZZxM3wuRy5q-_yuYjysoO7Z-96tKtjjoI9E
Message-ID: <CAPE_3zK0Za9GQaCTX4ZJu4_8Qvq7=c49MXtPduUwHVzQpf1t_w@mail.gmail.com>
Subject: Re: [PATCH] usb: misc: cypress_cy7c63: check control transfer status
To: Greg KH <gregkh@linuxfoundation.org>
Cc: johan@kernel.org, kees@kernel.org, o.bock@fh-wolfenbuettel.de, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Thanks for the review.
I'll rework the patch as suggested.

I may be a couple of days before I can send the updated patch, but
I'll get a revised version posted as soon as I can.

Thanks,
Keshav
