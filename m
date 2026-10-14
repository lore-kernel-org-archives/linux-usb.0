Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E673C0621
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 06:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958192; cv=none; b=OXVnVGiznMw3Y2Y+n4W1PmGX2zkxSPMDoHqMiXQeqWFPquuJt89tG2OK2MypkXzcE6rkoQVXDq0fHv1IRFUaLBCRQdxzJn2B4NC5iUAOHfj/IsLWrX0wLUg0zHk3Yylnz87PyUb1dZrfNVhLV4+FuUJ6RIv0VVcTHcvydBBMHa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958192; c=relaxed/simple;
	bh=411sQBXKujRADBe2C+466wylgfdBXbr/zBL19k6zImA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mPPwWpQuYQ0Htff+DTICcGv8xXzlXKbgq7KD+JU3+tE/O+EvbSjPcMHvQAEiwBtCAtI9A8jzb0TgFix4MIAED4jujLTscW59i4R1JvEDh6YYIRgSx4hgQFTmJ1rBwtCUC5YszulQ8Tk5rZMyRbV+sh4RERUkE3dirPP/ltf9hLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hl1oLh9H; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hl1oLh9H"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso2640737a91.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 23:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791958190; x=1792562990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cV5UIHuCfCh13j6hF17yh8heO2eNgiNWSkwIHm4m0pY=;
        b=Hl1oLh9HoNGXQt75Shspv+O1/MfZx8HSjTIYV1X+o1HI1rT9x6n8HzC7Lndf6KWElv
         X6xgHWGCVKpU2hPNpQHUd5QRqz1FbJYxA+AsCBHCNOmkQ0Nyjyewa4/vDDMdzfqOg1Cv
         NOhCg/8ZJcYkuTKdxy6cl+ZFedcUU0XYu9ulLx2iYBTfUar1QpQlsrWQgbxiuWDzcme9
         ZCbZhy2cbwgQCsiMLkSKzuaWvnta9lJugCnz0508EMC9uSF9MzAMDRpDsrdLWYN5EYw5
         PBp62nIHJX/3oxHrfAvgAXBgYsxhDGnwQeCYw0BHfJ/g3DH2TLCgoFTth4/XbFwACTEN
         oHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791958190; x=1792562990;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cV5UIHuCfCh13j6hF17yh8heO2eNgiNWSkwIHm4m0pY=;
        b=t4Bs69GSwpL+nIttSvmTWNfrMJy5GJ3mSyQcZzSWhaTuUIMiG2NyE5u6zSrzYGH/4k
         DfCUWXIg7d4QzDDL5Xi23Ey0fSW7TEjmVKA5IX7s6RvwsrQeZ0AUOYXGAZ6SQckEhg7F
         7Y0J+Gs+y5WBnAcEZqNkWLCwsmWMIQI6vw9UTF6D1Eh2JOgXqd/ikqnCbY5BiuPnNtO8
         zY387mkMzceMcdz+a8TFlBcC0axr6tb3jfidkMsCZOaD85hzTEo+q+Qi86JY7gAlkesv
         PJkeokkDt7xiex+/H9wKvwnjzuG6/kzVyFKVMoJs2Ve9Y+6T7dz11mkSTqTCcx0qYwKq
         OyNQ==
X-Gm-Message-State: AFq9FYLfABm5lkoX+yygkZL5drv/XPIEG3cHaPphlWdFNkJUWaSgU6Eh
	RfPt3rmPIAHAP5+Ukg3WbpSk+abeTwoSvcVTTMrvWUcyPSl48O5YhZ1f
X-Gm-Gg: AYBFou3zVQ4hm7Ct61v4GcvHS2ZMakI0T/6KB4PCsUCru4fkchfoxkP3jhvG6zZvNeD
	T4JSam6RqQ6ge+shkkoGOQa0QA/lBcSaowzVvveWUcKpsQ4walLRCitN8Qpw/q85Wcetd+Pl31i
	pWXnm5XgDPpDK9lpczyn7mKPNqeIuQqaW3bTwuijsjZW+ooE6N1bLAXViQRMWLlS94L8BAWUwMZ
	8h5f3jFQVvwqbVfmuXcH1zwC5nqJz7ga1soDEyJhmUWN6L1yad8jbik9FUGNBwobtUmYN3C0ebW
	HF2St7oX0xEc6CJZx3IRUKchC/YMIhc+U/GnhTU7mvYQ6u6GH1+prlweCZ1Ps1YQY7mq5XQeCvw
	zoN/UwTbyqW2RFi2RKlhpTvGUntO43JX2FvO74D9FJzu/AeftoXHCVwt5QBd+W5orimSkAcIcKU
	earF6FVPBA9/CCbaEtnGJ/EHjsibCPI//ktBcVxB7TH8WGqtsQPc8p/Ta1O2Iiac3E8tdTOHIf6
	YGNy6taVqJyT6fO29p+7zA=
X-Received: by 2002:a17:90b:5486:b0:39e:6a7f:1dcd with SMTP id 98e67ed59e1d1-3ab3ab1d56cmr13363689a91.41.1791958190360;
        Tue, 13 Oct 2026 23:09:50 -0700 (PDT)
Received: from [127.0.0.1] ([2602:feda:30:ae86:295:dff:fe84:68f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24a538sm2984964a91.9.2026.10.13.23.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 23:09:49 -0700 (PDT)
Message-ID: <b8c40900-c5f3-453f-a440-6ea540c684ff@gmail.com>
Date: Wed, 14 Oct 2026 14:09:46 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] usb-storage: 14cd:1212 returns incorrect data after large
 READ(10)
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <34f2ac0a-04d0-41cf-a2a4-11a93c7c9b91@gmail.com>
 <1ff84ebd-f805-4f16-91cb-ccc805c8e946@rowland.harvard.edu>
Content-Language: en-US
From: Xuntao Chi <chotaotao1qaz2wsx@gmail.com>
In-Reply-To: <1ff84ebd-f805-4f16-91cb-ccc805c8e946@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 10:18 PM, Alan Stern wrote:
> 	echo 14cd:1212:m >/sys/module/usb_storage/parameters/quirks

Can confirm that fixes the problem.

Regards,
Xuntao Chi
