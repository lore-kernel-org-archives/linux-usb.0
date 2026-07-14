Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF34C188CC9
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 07:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012821; cv=none; b=CN1fHX1ELIgYb3UuJO2362LW1fM5peV2nLCJzyktsNA7DBnBlDzR6lK+bMM7XuKa8zCu2F1H2ik4f6Q0Y2N+N3WW89J+fw9oZO/jfn0GKM7YdVY89vP7lDQy/qGwJHkUjvBjLrH0jwqBhsIuYqZ+1Vm0X+MLp2thLOlvwnakSo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012821; c=relaxed/simple;
	bh=R00IyKD8YmVTpzT3oKRxCET16Jfo3WzlpV6iTHB3d08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vqbp0ty/3uurEdGEOB46+JMyl7n5A/I94aozlwBmeVo53UxFMWQX2ubIp2vg60pWi2twUYpZb8z9Lg5EPL6+zrvjZB1VFm4IvaEFZ76GykV+l/glC4ax6wo1piDezTmZ9UmUEFyOO7idYIkANOhneFKw0qQj5SnpQ3lbf+iksTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=c4kG26Sc; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="c4kG26Sc"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47362928f65so3687271f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 00:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784012818; x=1784617618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sLuAgWqogayCgUsHtbAVAyyuUa4xWH11In5H0/Tnm5Q=;
        b=c4kG26ScXnYyRTfXycdZles1SvQ43PrruuDTG69YE3NKpUq6KLRbbN+wzaU1U3SRBk
         9oENQ2HHGE++LJILCRR/pjSb/dHPa5D1AOy+8njuL5UUjMbznXJU+yx4TeLieFLhDxSY
         6rVLLwzSHYZWu7hXOhdUSc7JhOaZXLTNSlAHy0EMc1hM2FqXYYn5gJbVS8jHnlT9HZ6V
         G3DH21N9Vlt/0s7dm7+/k/68/qdDxN0yOazg6zJ15s1CBEf1wNVZvYs59Uel9n16VLfc
         POzoCdY2/W2wZ6RG8gXH+PKgwuw0LfDeQ3ZTzzjnYZf8pXRXxhszu7vPUWaNgvKeX1mP
         oTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784012818; x=1784617618;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLuAgWqogayCgUsHtbAVAyyuUa4xWH11In5H0/Tnm5Q=;
        b=NpKEW/RmvHPbl8rcJPCO64RAFN0q4EcN9x1vDSBbWUNzekOh2uOMWo5dyMRoXN9xpw
         HldD03TsNzMwv2FyceTMnltv/z68hQSjTixwp/6b7xrcjilsN5AcGA/BAbD1aqxMa54J
         8Dw0OBpRN7gNzOoFJjkBG+cdCpodtZZPx0/tT1bl4OOVsZqZkkAjpo85oAZuj3JLxGO4
         VQI1oP7rGZCbOVkeQY7qo7WuEis6m+NJPbu8DhPXVqEBH+4APjqhdUYbldsqzJfIgcRl
         mfFERxP0Ny8yEB9iCSIBdnxGINe31wg3dQXkXi4xbqQ5+EtqP55D422T0zWpWf5dF8ba
         BJ5w==
X-Forwarded-Encrypted: i=1; AHgh+Ros6aYDKs0Iw0yYDPxwECmiqj0FQHoLCqKc2txqeKdCORLdb7fOJTgh1OHP5dHeFfx38/XnXxyXT8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwILVjEy7NMr6O1yzMCRsplBqlb/D1w+Okv2PZjO2y2Rerhal8i
	fOqopuhQtNNFjBnJfemqCTIfoIJWIESFeV+Qm6yNgum0qSgIeHlcTsDbcH9m6yBNrpE=
X-Gm-Gg: AfdE7ckz/Y0Z+ZkELkJe/ApcJnLhZuruvnzbHZiz2rnwNWcwf8M/iLiApYjPVnKPYBP
	UVPhIBzSTXUzagyFxUsul/OwnLMRbcduUIpWiaZk+pKP4H477onMqPWpWdDZKJrTG+rXFULA69V
	0e2GDununhyPsjoBiN449G7z4qxo9dVNeAmGzI2UlJe0BAecy59SH/M6qoDwv8qKXIwSkEMmZxA
	aeOHehD7PXMU3mTtxMu6S1GQ3nM6VsV+Yn5xUxG8Z7wNEB5rhGJd7SD/EMojNp5Ltx0CaYx48hG
	gENRBw2qfcbzgatRlGswLbJjcme60oxm3dyy06i26TbFjyJ2VleG1qGWpuQsLvEgWFthp3W/3c1
	PZTRIqepwVCFw2rj7wS5nmgNhWIjGC8KJTezuUP5heHDeOtx9KIQZq4O7ZgAuWBZqge+usswCvj
	lvr8IFMuMCBJHPdne4pBKpBzHeBtHKVU5b5LcmFV7Se0SYnd1DSx80xhM=
X-Received: by 2002:adf:e18e:0:b0:47d:eddb:c11c with SMTP id ffacd0b85a97d-47f48863ae1mr1442886f8f.27.1784012818143;
        Tue, 14 Jul 2026 00:06:58 -0700 (PDT)
Received: from ?IPV6:2001:a61:13c3:1c01:3157:c849:4aaa:fa65? ([2001:a61:13c3:1c01:3157:c849:4aaa:fa65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f84sm5478149f8f.27.2026.07.14.00.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:06:57 -0700 (PDT)
Message-ID: <73b0f23e-d7e1-4227-9a08-161ca45b7a9e@suse.com>
Date: Tue, 14 Jul 2026 09:06:55 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] usb: core: strengthen size check in
 usb_parse_interface()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Griffin Kroah-Hartman <griffin@kroah.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260713-usb_core_patches_1-v1-0-7721c2b33f53@kroah.com>
 <20260713-usb_core_patches_1-v1-2-7721c2b33f53@kroah.com>
 <b2498cb4-61f7-429a-920a-e27ecd7986e4@rowland.harvard.edu>
 <2026071406-ambiance-rogue-39bb@gregkh>
 <f298dd66-987f-4e37-ad26-621dac5b5d1f@suse.com>
 <2026071438-emptiness-judgingly-4a1c@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2026071438-emptiness-judgingly-4a1c@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14.07.26 08:30, Greg Kroah-Hartman wrote:
> On Tue, Jul 14, 2026 at 08:20:32AM +0200, Oliver Neukum wrote:

>> The error is easy to make. I made it once. We have the power
>> of using comments. That place needs one.
> 
> Sure, which place, usb_parse_configuration() or the other parse
> locations or both?

We are not taxed for comments.
If you make a patch adding comments, really go for it.
Both places.

	Regards
		Oliver

