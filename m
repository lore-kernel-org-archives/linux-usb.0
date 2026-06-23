Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D01357CE5
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782199887; cv=pass; b=lmz3vkZtThhmT7YOiqZU9kv5LQaSLl+SlDal1m/G5AJ8lNzj+WJWWzfUs+Phtoywz0B3/S4nDGg+lrGhqVkd+Clw+Rudi1zw85hnro2Tv96bU/S8MP7vlFD3cpFfx9zE9ZLdieoFUocUFJuxHX4ReAIc8L/z+NfKVh+7cSXNnbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782199887; c=relaxed/simple;
	bh=wNnxLYnrYtZlvSO76qoO37z4hdu8yf/j9NrnkipyBDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eb4g+SnDoPyZ2EI8Lh/lK+mEJhO1OBSI+xVR5dYtL8a9bAssEnur0NlWT+F2H75IhOqyq1YhRRW949jHC1ozlqgmtk2Hfk0i93ZgV75UL5L4j+11kph6Ns+gi80IwcF8dD1kP3etMb5JVLgufV4GOJ7jvjS+wp5POe85p4OcTQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcgF2gCn; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcgF2gCn"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69690062350so5001703a12.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 00:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782199885; cv=none;
        d=google.com; s=arc-20240605;
        b=Xe8vOuBKPu116WF1cqlNrZf0aY0U+r0WmCebuUtV4fXsNueH/mgdt8f+YZyBqm1Ios
         nBLR3yAm5HF/XVVd9L2Lz8Co0N6mqZdx5NNa7w1MX/1RVgmZrlP1BupGbvll/44KFRMO
         v+bJzvhKKM0jI05arBVMQ3Psl4ro9jTdGv/FpjR+ve4DeuqV1ZlG1gDK9K7pXBV2QxE6
         oSAsIliQpVwIauQv4y37DtIHu0u5D/sjRacMG570ulrYrPNfVksMkLK772VZbeBn52K2
         Ydwm21/E1ZxPUANdbiz9VGL/Te/KwxUSlpXj7z1O1kTSsQezhsnaGMTEmYszwhvxm48R
         PRnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wNnxLYnrYtZlvSO76qoO37z4hdu8yf/j9NrnkipyBDI=;
        fh=07g4tpHnOgrhzKKNSUpFc7vl2Zhl3DRLp5LdrzBRDIo=;
        b=i+uOfa4PHhlu2QwKdJv1T5qG5yA4dZ1uHajWgWjPzwbMKXHTpZZsaEnerpCnCh7TA8
         g3ESLOeJtmEjsRtk5zsRrULy7/VM9YwbBIsq4+rDLYRpZigCCp0qDGifLQEUbE/oka3V
         Y6GrRSOjBJglgr2G02tdCquyJFUUlYtl13dS3ZTD0yjPWYS98RhL4VXCiQ/M1PCZfR5C
         eL+RDIMPVYOMVq91rGeYPwYfgXeqlA6r7YuoGDAiF2NvUHdaGw4bxoJlNAaGz+zHKhle
         UwqtSl+9FBLDuX4e0insLGTxa1C9jZ039DPhXD7Jbut69PyUESz1hmq+J2NmKjSqNtw9
         SB3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782199885; x=1782804685; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wNnxLYnrYtZlvSO76qoO37z4hdu8yf/j9NrnkipyBDI=;
        b=gcgF2gCnXkcAW6tmpCuB0TCOMS9d0GuVuiZw0RerJ3nEHxwOr25L1+ZJE6YEwlgAh1
         CYaNIBTcB5IPtz2QuPGcZt8+I8BPK3aHArf1AGkRbxBghRXPe4Wc1dz+v0VyKRTQeWTY
         VpVGgpuPO88/EmiTdE9eh/HzY+XZHAfO9xwTHZBbnYbldGWZHQ8quumFMtos+ALT7uIE
         WgTCK7gn0W8B9MxAOvl5W5BnFSG/BsJLMMIo3Ip0vbZRQ2RQT1n0y2SW6N5JSt5YqD4r
         Znt/1irOoJnOUiRhZLhLjwbW0SZ9QgtpBGUZQb+arhsyIYgCMVCKWz+qOm5qoUl2C/rJ
         UUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782199885; x=1782804685;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNnxLYnrYtZlvSO76qoO37z4hdu8yf/j9NrnkipyBDI=;
        b=PwFSzH7ia5CQE7K/6K9kPVORQqZg70qfdF3jK+9MBbv02bx3W0pjk+3MWhJklcabq8
         8bBOERFuyxFqIqMBkvVEG6cRANDV9FMJvwLXm/97uU3ACT93+OxwcRgoKMxfCj6HxyTQ
         WiEQMpbGojj7PbY2Tf7MZQcnM63seQq0IoWNaQSYZOILYy5b5de3NF8HyaYWpwb7+So3
         ufimBUFRsyD1Q8Q6birwWSinV015LkfM4rpMZpfE7C/QM1vWYvAuhEKUt5vx4ahqgR9T
         Ycra2CNiIjeRqbVgrOwgGfcTdNBRFmq5kLWQ7IDNvysS0zubpMpmaXThtGD9bgyMLO2E
         t4hA==
X-Gm-Message-State: AOJu0Yw5heQttIqnSgaV5+HeA5WwWxLVnNonN0fXhiNr7DSw8vK0P6nU
	YP21cYyFM8ABqosMGydz6VADOJa8vXh7M/zMSerR852klc48tlrJJ2y5q6ouV47N6Ar/ba7AKKQ
	YA59ME0ORVkRROcgUoWVsndngP5gUpmo=
X-Gm-Gg: AfdE7cltuETUMS5aUmUs2V8jKb7/oJG4+vDUtaRUdOtWUF4LzupceE9Ef0giOIwcv5B
	QPiuUBi3DJkfmzH9ogpLO/Sj4BD5sBHorExlf9uq1Ayhu3gArgTkfGnclYPixjBmMHx3G9Ipea+
	HmVhna6YGXm5jjPSWOD6wLijzxacozPuUfbOeGNL3sV8tsu0+5YMAj0SW50hg2p8s8qStzCDY0Q
	uKjsH5IkOGzHvfX3zrNLoAhgOPskJirqpGheBZ9ki0OG5rifZPIgPjfVHH40b3+K8rp77/GY5RV
	AZsBw2lHd7zlVR8+aKEeq0MIukfdgi4=
X-Received: by 2002:a17:907:971d:b0:bee:c13f:7ec0 with SMTP id
 a640c23a62f3a-c108c7fe9fcmr55355966b.8.1782199884534; Tue, 23 Jun 2026
 00:31:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619095936.24080-1-nikhilsolanke5@gmail.com>
 <8175e40d-357a-4513-b827-752f679e9904@rowland.harvard.edu>
 <CAFgddhKKuGQgu0Ahu_WRyZocQGwPZkUejjoaJQ+P8--+k=Lwkg@mail.gmail.com> <8da4a00f-a01c-4b38-82a3-a718e5588f51@rowland.harvard.edu>
In-Reply-To: <8da4a00f-a01c-4b38-82a3-a718e5588f51@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Tue, 23 Jun 2026 13:01:12 +0530
X-Gm-Features: AVVi8Ceg9WedBgeSh6qEiGvuEGTJVDy2JLw21bGpVlYvaoqzbD0_RraFsYA-2-A
Message-ID: <CAFgddhLVAp7nMX4YUHoaG+Q_Hm6w1uq9df2kH+4RWiJJGYDdhw@mail.gmail.com>
Subject: Re: [PATCH] usbcore: Add quirk for 255-bytes initial config read
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I have a v2 patch ready with all the requested changes along with the
documentation in Documentation/admin-guide/kernel-parameters.txt. Is
there any other place where I have to write documentation?

Also, I would like to know the "low-level" type reason as to why do we
have 2 separate buffers. a desc and then a bigbuffer? Why don't we
just realloc the desc buffer? Does this have something to do with
reallocs in general?

Also (a bit more tangent), can the usb device potentially fingerprint
the host os? if we are asking for 9 bytes first and windows ask for
255, is it possible that some usb devices will fingerprint the OS
based on this, and behave differently? are there any other such places
where fingerprinting is possible? In those cases, is it theoretically
possible that this patch might fix some weird devices that "seem to
work" on windows but not on linux? I might just add this one line to
documentation that it might theoretically fix other usb devices as
well instead of it just being a quirk to fix a game controller.

Nikhil Solanke
