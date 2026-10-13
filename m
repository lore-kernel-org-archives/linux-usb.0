Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA352D94B5
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 13:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898888; cv=none; b=hhIn7xSKtN3ZN/qVe3Lh2+U5YDd/nOcstgS80CTRnNhEnrrckcqPTMzQu2Xk8plZIhlenB0SMXleS+9NPBVSy5CdpwVDibn8XciiQLRaicRRqPtYbpwUG1zt1DEY84UTLg4mLRm5eHclPuf4HO4KGJwRnMRa4qC+VOMO4PfswOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898888; c=relaxed/simple;
	bh=/RTu033VlwJ9e0oapQKMl7yfI7+GbcQgR/7ycBUqfuU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=dDl1Bz9Dd57jSjyRAQLQzbVDb6QWsr6dRRlLYUI3TzZJSxZIYfSfE3hu7wm6fQ4aO1WhAMgawGIKopph6MG/ZWUhVhROGZw/wsqnk9PYAXOkh+X/rsONj7KxnmjSBM3lh7Vom1odnwT0A+uvon+u0BjOWKqKLR+Bz4hWYMJx6kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwTrWkLn; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwTrWkLn"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8875d220446so1415632b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 06:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791898887; x=1792503687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UEr7nVXn9dfA+3Y3/gltmjKKnXP6bzWJ0+fALNgm3RI=;
        b=RwTrWkLn9z9XWTBv7hWVvDMWph3rxROLAV/gaZosBiExni/RYdasHazZtR7Yyxd/uI
         66CPNp6TzhTOkXz+z8dOGRklOlbyhpAfc1+EQcbX6bjjfB5M9nSwiFp4kSSFIYWKadm5
         WkKiTrC6BLNjcNp3FuutcOIVg08KTyBSRvzXvnmdQQUT4V8agarO+idIlerjwp653ugj
         30xo/RzSYHdsp+gzgNmWi0G8ue/vel5WueXe5/IPYNOwPCs6p8bRT7JiFXCKHVPS3cNa
         i/5oU48DgUbnf6k0pXt7lTgGCwZUg403OgvcvvpyXfLkTA05tjLsfjiL9DLBqabCkUwo
         BkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791898887; x=1792503687;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEr7nVXn9dfA+3Y3/gltmjKKnXP6bzWJ0+fALNgm3RI=;
        b=nYzAAXPgTeMzHqPK5d3eJXc/uPERSEvPs7H8Zgw3GtVEctB6u6v2t/2beOXdq0QO3c
         hG1CDz78I00Uf+QyEVo3UWDrgALQJXNWiNoIYnpbnzu2TmjtdsPbtAdUURIcftfDPJjZ
         NaCYMUgfu7PHus+/DEM42CRupUrk2cILoS7GGnegSOm9SRB4GAI5QevIYdUXCqLEH+IC
         GjHVdfX20ZWD4p8C3XoY0lAHMnm2E4dIq6qU1/Py0Hc/n7CNYTDJeiLHBiXwlzww0Qct
         r4C0pVyxy/S5A/yDcupTQ4pHCXv+HLraeIGzaUvKc7q26Ve9nlE31U5OykymMkHnVy49
         +R5g==
X-Gm-Message-State: AFq9FYLohu1CDqJDoYA7edtX17rsA6nuu9K8zI0mk4Jwb4jp/2pqagtH
	DhaT2vWLpnD4uA0UvO1VoSibmQGPcWQ4AwJu+DHQJdCM5qMTy1mVG/rt
X-Gm-Gg: AYBFou1O96Bwk6WgVLEk4gs+WAjadspZ4qso6CZ8SdW13NxrLVJF5okJ8v90uRBPfCq
	dIxM2KnNz/MR57HzZ6QnmsWWWr7q5ycol4peLdoyPKuI5d/rrM79OW2QWtHKi+Ofrfsn/T2BDck
	vVQXU0SOMNXJ1n00MB/+SHJ2cTN5P3OGpHRlrz878CLlWxUePNJwzjWkdjnVDzA5By272OIfYrm
	Uw/Vdg8Qi/hIZ7wd70Vzj06ImaRmFrdlKQMf5kbpz5zWdzGreQMV4x0/7VOviLEWz1BuyJ47DDo
	sH3r/wElsJO3AJJCF+AgrCA7ClgTjGQqi87nVGC4h7gIPVuKAaN4Fiqs3fFhJoK/cBbHYOu071C
	xvVjLFBn+TRmLqQl2JtLEHbYHCP8EiokLr5SIwe7juh+SSjC8TR5ZrYYDcIbCeOh2u2Xrbbyn/I
	xgigad2EpbwUX2B6R+VPiH5DF0VLVVO3eEKuyjp/G1+2Sf1/1LNpG5RNXgEs76Z0TWhkULenXFD
	tMkQCVlt2h9UO2rADc=
X-Received: by 2002:a05:6a00:23c8:b0:874:705d:f64d with SMTP id d2e1a72fcca58-897c6443144mr9896972b3a.27.1791898886497;
        Tue, 13 Oct 2026 06:41:26 -0700 (PDT)
Received: from [127.0.0.1] ([103.175.98.76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c310737esm5187059b3a.10.2026.10.13.06.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 06:41:25 -0700 (PDT)
Message-ID: <34f2ac0a-04d0-41cf-a2a4-11a93c7c9b91@gmail.com>
Date: Tue, 13 Oct 2026 21:41:22 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Xuntao Chi <chotaotao1qaz2wsx@gmail.com>
Subject: [BUG] usb-storage: 14cd:1212 returns incorrect data after large
 READ(10)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I would like to report a deterministic silent read corruption issue with
14cd:1212 USB microSD readers and propose adding a MAX_SECTORS_64 quirk.

A READ(10) larger than 64 KiB can cause the following READ(10) to return
data from the wrong LBA. The trigger I have found is that the second
read starts 64 KiB beyond the end of the first read. Instead of honoring
that gap, the reader returns data starting at the end of the first read,
that is exactly 64 KiB before the requested address. Both commands 
complete successfully, but the returned payload contains erroneous data.

The same problem is observed on 3 physically separate readers purchased
from 2 different OEMs, all identifying as 14cd:1212 and with the same
serial.

Device and environments
-----------------------

   VID:PID:         14cd:1212
   idVendor:        Super Top
   idProduct:       microSD card reader (SY-T18)
   bcdDevice:       1.00
   iManufacturer:   Generic
   iProduct:        Mass Storage Device
   iSerial:         121220160204
   speed:           USB 2.0 high speed
   driver:          usb-storage
   logical blocks:  512 bytes

The error is reproduced on an arm64 machine running 6.18.54 kernel, the 
same machine running a 6.12.112 kernel, and an amd64 machine running 
6.8.0 kernel, and is confirmed directly using libusb.

This has been observed to cause data silent data corrupting when 
mounting an ext4 partition from the device, and setting 
max_sectors_kb=64 as a workaround fixes it completely.

Would adding a US_FL_MAX_SECTORS_64 quirk be appropriate? I retest 
against the latest mainline if needed.

Regards,
Xuntao Chi
