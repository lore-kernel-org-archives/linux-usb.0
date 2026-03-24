Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4490366046
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346240; cv=none; b=CfOpmBj7tL3aklm7aWqQhehm7LCpQxG/1x++dr1huuGw5yQKVC+2SnsF4AzdkezOrFCV0ywr8kuy+P9XKvLMz/QHxfjdWfWzlpFeVEA8IysFkyu55h71GSjy7Lrp0MPkldarNd8PcyiQjbrXncJG+hmmd0TKZERj0USq1RQ0cz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346240; c=relaxed/simple;
	bh=cSSRqdl3bRjI2qTVJyh+oxlQnsH6b6ppDKYP2gx347M=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=UIrzoQFR+4CCIc+0YLmGrqFvyurOTmiVrDY/9dQjtwmk3YbYIS4Hc+iCX0j3S0P+/1S8I8qaAFb27U0h2V8i2NknO5U6Nv9i2YKZmyVivPBucS4wx/zYOtfqKluzMNWmQw+fb2NOF/V4RDDKPukTGVBZCKlEegcL2QO0equuxJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Bp9rD6z3; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Bp9rD6z3"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so3751322f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 02:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774346238; x=1774951038; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWjO/xgvn1SjtSt3LipRq2Pbv7MghLZ9edNo1IpvDhc=;
        b=Bp9rD6z3rqlIGN18U7jtBZ+TTZmhgFZ/W6ESP+tQuR+IG45FtAShCtWUfTIn3TUzYR
         P3NPLsmlsVitwNaUznQ8xByLXA4TOAZ06rct5hXfM1vRk5h52Qm05ef3opRWBp/mIlMG
         e3hvEddGivNXgnaO5TTyjwo05wCER69keCIzLOhUVlNj2hWKNI45Yj4rIHV4roydL065
         XqPS2J+SgoGpgzpNNePTyVgbx/YA1xPfsGmnWFnFoB+LMiLOjRFBBzydtW4q4PYVnvj/
         PmgZahINL5ROIW1ZJMjj4I8xfTrlPONxpFFpjjFzeKaJF59TkwdvzaNgRBc6uvxlfiM9
         S4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774346238; x=1774951038;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pWjO/xgvn1SjtSt3LipRq2Pbv7MghLZ9edNo1IpvDhc=;
        b=Pil8LY04OUfEBM3K5/DSDYdzoyiPdjCVtXcW0imKLGXjXSKgrcPA8jK+azXrhcigqc
         71sXOTTsRd4Hu49/4LD4eH9Ua+d1YrI/Y/MhLrMJk4oUdkMLKIJ1WxZTT1BYku/tb5tH
         64TVUvMBzxKoqV9zWUP0PYiLYwlIYF8FuvijOBHIUGiB2fzr+m/O9qak70nYHCyZIR0m
         o4U0SIRdHgpgI326bWzVn200Iz9ElmjUMIPrIQhpeQh7QQGr8QFlFoU5qVe97SjkHF68
         ufTYd4VnnbDIRH1f92nY+oh5fu1WHbl4/FI2+qJGN8I04gJ7vg3ga0JnAJTet4zXkUUe
         BkDw==
X-Gm-Message-State: AOJu0YweFxSopwEqRuXW6wqOGnF0Q0QGCauIDvwcSpfa7FiFe3SC5oSK
	CmPyCwvKPcFoQ6nA4YQRmMcfL7nUmPO08C/SABh/4uYv56OQsE671yoMa5SAnLynORg=
X-Gm-Gg: ATEYQzwjK6LDzMrdcEw/I7f8pqpkkrwQjD2A5uPe3IRIfK1xdONzMk82GYw9CZFOhC1
	yODN81PvKfbdgAD+1JY4PqO+rbKnszWiByCSqb/tG9EFz6Wb2EsohLNUu0K7vAXpxLN23C6IR3q
	ax6849mSCZmgO2LwbKRizVGMA3QLnsrIY2OWdWkB6/70Ue5PxB4ONci5Bex6ATipXxAWX/iV/d/
	OCetWDPK0L1T+6ETcRraMQ4hYpLdzcktukU+XXxJ71zwNOR6WlBntF02sfiJCYKgMgCW+caabCh
	8eMF9eHJAv2tXLU57JafReQBvNNIDexNDZtq6N8XvVsNLFg9Ay+92X9u41yebf7XNiUTGUQV8AW
	OW0p4gM+qFtQzZWGtWz7oTzqKZv64IlTMq64Tl/lvv4W6EX4IibY7NWV/47VGkG/mO0QbCYlpex
	4N1QrWMaqZlB2PQuzcEyaXtj2emycWqJhFzoyeLwu5UOwGB0No32fwvEPGSTinG7Uh
X-Received: by 2002:a5d:5f86:0:b0:43b:4921:8743 with SMTP id ffacd0b85a97d-43b6428168dmr23971363f8f.42.1774346238045;
        Tue, 24 Mar 2026 02:57:18 -0700 (PDT)
Received: from ?IPV6:2001:a61:1332:2a01:88e9:6e6:b5b2:fd40? ([2001:a61:1332:2a01:88e9:6e6:b5b2:fd40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae619sm37731853f8f.5.2026.03.24.02.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:57:17 -0700 (PDT)
Message-ID: <8d665258-6dd6-404a-85e0-a2f3420cd992@suse.com>
Date: Tue, 24 Mar 2026 10:57:16 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>
Cc: USB list <linux-usb@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From: Oliver Neukum <oneukum@suse.com>
Subject: Question regarding error handling in usbhid
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

hid_io_error(), in case it decides that a reset is necessary,
schedules reset_work(). reset_work() in turn calls usb_queue_reset_device().
Why? Is there a reason usb_queue_reset_device() is not used directly
in hid_io_error()?

	Regards
		Oliver

