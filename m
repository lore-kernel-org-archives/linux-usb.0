Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2B4391845
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 09:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450831; cv=none; b=HXSm/oYK+T8JIRu3i0IfUYRFkCu9iNTKj2rBowYNs1tEuISYUm/yQJaMMGh81h4aaZoBNc5OTTawpSzyTF5cPPdZYRguZgD8j2VOPIuKWDtVqjwC+yS/roVkwidhHPRqyUCzpG0IYkGpnNRkvzZcM1Fu+YUUVuQUHAxxAXkMXeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450831; c=relaxed/simple;
	bh=39cqcfQrjXbQVDrgutl9jq4/S0DIYddiCi2CSgqmwlI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VooTaQB1sZ9nT/JR0YiGZK6vvyLuIb9SMTLBAob7etDIV2HQhVy0Oa2s8M394RFAhDOfAO8e0+cT7IdVA3v3r+/tm/hujZPC+OPIkq8higV2wvpKW3iPEXuv1i4vuCmJy2FqvGqnWWongiEXlEWEiKOzqWo2LSYxWcgpEsPAcPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=paO2nzTa; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="paO2nzTa"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so31509585e9.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791450829; x=1792055629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uzVTLgexepr35s9JnNBJGDrwFh8PcTC+Xh/4HykqRdM=;
        b=paO2nzTaRB426qrjmQ7LAeIVEXeDXABL/7wawUWw7lP8E1ucF6oB1bUvElmBihNLNV
         1nMwyCdVk67bGQAT4l9HmSX4RUoUyhSceQacb12LDpLC4nAK1YRaHcyqJ7IQQFJh57oM
         Es5TJSMXuzQ5H7rkyQ0oKFU1Zo5e0PPGSJthfC0rGsnZsG1nvp2XiI5Q7X9HzEQqSWGq
         eT3FYtqBwZlaDXsINfHS7clZ20MqQh+SKPHa76BIz2ItPUbmjobNueQspsaEkVWj1Be2
         BuibP4aGbVLyiU0Qf4Pq3eRZUk3DwlepspS4C66lYLEnPfSYz0jnZ0T4Zw+fAQdJm87j
         E8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450829; x=1792055629;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzVTLgexepr35s9JnNBJGDrwFh8PcTC+Xh/4HykqRdM=;
        b=MHgy9vxsgrQQc2uG2lbzKamjLXM/h2gwUxtuVSq0F1OnWt/JousohtuB5hB855U3HH
         HCNDMb9vlzvRvGyawGC9HS6PhyFf9NnA5/LNRKykDdx3QJ8I1I+rqPRncvE+1tlkk3jN
         gHxa9D9PV/1128f0Hx7HOvplqUL4k6cDVmb1bmwvYdb+kVieFGl3eVEF20Q3g8giQxLD
         hOPjj5svRoPeBRrOIfdo12i+Sz717CyAh0P5wwmVh6ZFmJFtZjgT3vx3jZu0B76DA+yX
         BiKTWtdjXZd02Kl6NYbnB4DCM2mJD9P9djPl6FhzTivDqmVBeWbzA5D0jHsao09Vqf2P
         7OsQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6rdmZM4gXaMJrn3uMH5Im8viuIjnnJZN8YjOqSXxXLk4gFcKG47vEPp/EDC+9qxABvlt2iebQy8c=@vger.kernel.org
X-Gm-Message-State: AFuF++nyAQ3Y2Vlv/HKnvUCmK0WQ4h7Zm7L4Pct1XC0xCrMuUUv/Lejj
	H6Qr0PEYsMubI5XNk91b+eNH7inJFepSeWYJnjPQ2VzxQ/4POEIdaQZDFNjssGSU
X-Gm-Gg: AYBFou3XgGDyPTkvNwucKEY49FNpxC1lG8Vta1piFmwmBWh1PiVf9dbLk1uKphVE9rL
	lO2/TDc2Bho1oWm/nIPzKmFvNiAdle7UlDaVtNhX5jcz2vDfnJ5/ck9ci3aCHd2K7X5pdJj+DAG
	O7/MMfpAjztlxAyHJAdgME7wm0cZOFkKEpxn/SJ+tMYXMRnu7pY6af4iFyFPaoWgxHJ5uZWNrT5
	jNY1VcImI5wbY/s1oVYbv1MwRHTXtveVgaT0x2CSeKGl3zLzkAYJ754mXlxmRek8w/qIzIkmgfY
	jDmDbLg3fRb8OrPMvqZnJwfJxkW5hqhV7uA1xhG0jyUNy8zPT10m90syaw7No2cy89S3BtGZpHk
	Eax54SN8BRHFqWE38rdPyAUp5DrBE48fsEuLZKQm3N7K9nRl5xAMGfQTv6+cU72ELrCZFEn5tp3
	gbjeYAaqj3eA1S/RgbnszEveliE06uq4YawX2xzfBBmTWyXojmFZmu0v0t45deBwKZlrGpUI8/V
	xl9eF3+eQ==
X-Received: by 2002:a05:600c:8211:b0:4a1:6f78:842f with SMTP id 5b1f17b1804b1-4a18041acfbmr82397975e9.11.1791450828710;
        Thu, 08 Oct 2026 02:13:48 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a181aeaea2sm108319475e9.5.2026.10.08.02.13.47
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 08 Oct 2026 02:13:47 -0700 (PDT)
Date: Thu, 8 Oct 2026 11:13:44 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Henry Tseng <henrytseng@qnap.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] xhci: handshake timeout overrun and configure
 endpoint hang on device disconnect
Message-ID: <20261008111344.47d179ab.michal.pecio@gmail.com>
In-Reply-To: <20261008110642.56567a92.michal.pecio@gmail.com>
References: <20260930101752.15794-1-henrytseng@qnap.com>
	<20261002113012.271ceead.michal.pecio@gmail.com>
	<179136673328.386669.9410030239460428155@qnap.com>
	<20261008110642.56567a92.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 8 Oct 2026 11:06:42 +0200, Michal Pecio wrote:
> What happens if deconfigure manually before disconnection:
> 
>   echo 0 > /sys/bus/usb/devices/4-6/bConfigurationValue

Sorry, I pasted this from my own terminal. Of course, it needs to be:

  echo 0 > /sys/bus/usb/devices/2-1.3/bConfigurationValue

This assumes that device names stay the same. They will stay the same
if you connect the same devices to the same ports as before. If unsure,
see 'dmesg' and 'lsusb -t'.
