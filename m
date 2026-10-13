Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A46A3EC816
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884104; cv=none; b=gxRqQC8y+Nv9ykFOIc4WtHH5TW9hyP6wQBEYcwPdrBrGNF8rushI7543OY2+P7bIEHRrHr541GFh8ldPzLY1h5iZX1QFFFfEiOOksV0l1qq9Fi5nrQIgLmO+jIzSd6/oZXYtfF7QYIMjw0V/dNnRoaU2/vrF7twSWBxit2MNgoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884104; c=relaxed/simple;
	bh=WTd6RDcQSe4g1DBW5bmql3wwxey6/81WlmMPeti+8qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ur4Rj7c4ipwEWkqKWW2gM5ElVMXbAQqMhv+xiKbl/R/E4CR1CbSap/OMJnhnGPlqMWZ3/wIp7PGIcSkMd45YWhcPzUAMKAH5KK3SmyV2HRqYBDemqybOKQMnJ30vFjEWofsFKAw5/jG9gQslBX/U9tzOjuybDuFASrrijyUFpNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cQbhz5NP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cQbhz5NP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so21812595e9.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 02:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791884102; x=1792488902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u7oKHBU8P6VVCJPEp5uLiJNA6l4tFvXP4QYcJqDIB14=;
        b=cQbhz5NPJJUlZinEE9hb1rfy7fGObYKSZVWXxxTL/zc0w5fYEV7Odn+xXKSfMQaQNf
         uv1Y3szrfbz52Py/uyEN1kkeRqR/dDn3NYmy20pJeBdkYoSsYoDfPn4tMcpszwA6SbAV
         GqrDjMs8KGfm5QHDYseOL9H0a5hAv5//AD6Vuy8S75AUZWufS+hXjmBTS0kBoVAODlnP
         Oi6KO1HSL8YcKL4cr4k3wdsDwhxISTnS1SpA08NRFee0iB35jZQtJgf5NdNnGJjuY4gU
         ZxGHRnthluZThfAqO1b3BiU6BLiifJwjL3T3aIkZzJaTxIhB2uQ+805LjdM1vwCm3xD2
         OkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884102; x=1792488902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7oKHBU8P6VVCJPEp5uLiJNA6l4tFvXP4QYcJqDIB14=;
        b=gNYFzQmLS9pd6OnlRkviMdnaemYTuGan56tbj6qw05mRyqwzlhfotsNb1Dvr28A8as
         cLwEnJYCKW+//nN/1ToNeYrA1476nbDSWv1vQ+wYmjgeLUFL5CcpcEuZ/DyoLoupqxA1
         AHi0ljXt938Dp869gQbcDaPjYSBH/WiUslNrHx0sQmHZvrwEIp9YljlHajAaCG6Ddmyi
         zjK3/w2T60S6EVbctlMkIrhEJ2VxnWlxLwCdpW+bbqcLgCZ73h4UGHtBKy6b4dWWLBHj
         ae9wXGxTTuqrk684RrWRyblAfzFx7p+9tY/EDf0qGU0nXuJv34jdIu05jto8RQ/cYKY2
         DEEQ==
X-Gm-Message-State: AFq9FYLqutPDsNvbr0q4X4/gs4AKqzpWBYq9EPuH2qc7riDX7hNnOXR0
	rN/2yfVmQYxUtBqDYMqCEKfW+MH5nzAcraUJR164gzNl7Cl8x2EWC4uEcNMJ+vM95wI=
X-Gm-Gg: AYBFou3n6TEta4QCgh7V5tuhX2NTuz+mc0+fVU62eqyvhUvJco4xSdwyXeDpbSHSf9w
	5xJTR/FxG2NifwXAtVGcbIUeKswpeuUOYPe+uuXMXHz9K0TPHO+eXLuSdZKsIAyOTTR1ubXaeIE
	Tb7SqGGNZiGF+48AlqgY67h4hg8lkNCWLvIT2aGT5mOM7oGstHEA+enyzWFy8b9XE8vUTmHx2v3
	4i4QKa7COxwH3CB27R+rTwr3x51pX11HFpjShGSQGc2hzDa0m+U6tNKRJdqQeyax5jzX8E3dnj6
	bVjVdUNR6Qq/+N3K96DtsDF23xSIfhk/LoNHT8oXXN90Fk1AVZeletkKPuMISG9xYTzZTdwgYCj
	+Ekb6Px8rkohEEoEpAf1EY2OYPEzhi6jkfBCtq6vZBECDi+TinHftwQvMKiHDReSMEGWfo6Kjwq
	1z6cJoGTgzUXoy+Uj2S+V8KPVIbZWUyrb1ojdMf73KTfxzJxcPNptp0JcTgSjSPhVX0O0EGWX7l
	GT2fWKl0EiiNXJxFvLnlA1brPLlopuxB3DyDWmG
X-Received: by 2002:a05:600c:a088:b0:4a0:333:253a with SMTP id 5b1f17b1804b1-4a18e49c331mr234770065e9.14.1791884101673;
        Tue, 13 Oct 2026 02:35:01 -0700 (PDT)
Received: from ?IPV6:2001:a61:13f5:2701:b3a3:b9f5:f3dd:ee85? ([2001:a61:13f5:2701:b3a3:b9f5:f3dd:ee85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5262sm4167670f8f.22.2026.10.13.02.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:35:00 -0700 (PDT)
Message-ID: <b819ff38-6916-40e0-b2f3-1b19876971bd@suse.com>
Date: Tue, 13 Oct 2026 11:34:59 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: core: Emit KOBJ_CHANGE on unbound interface
To: Fabien Sanglard <sanglardf@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <b7c2f7d1-40fd-4d83-8ced-5fc27e3be051@rowland.harvard.edu>
 <20261012171609.88273-1-sanglardf@google.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261012171609.88273-1-sanglardf@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.10.26 19:16, Fabien Sanglard wrote:

> As a result, userspace clients like adb only see UNBIND and must poll
> /dev/bus/usb to detect when the interface is ready again. Emit a
> KOBJ_CHANGE uevent when device_attach() finds no matching driver so
> userspace is notified that the interface can be reclaimed.

Hi,

why do you want to limit this to that specific case?
Why not not always tell user space tat a device has
been reset?

	Regards
		Oliver

