Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092693;
	b=PpANuzDFqdU916W+pnLAtdfSmGwUbbwzgHNL5sfsmFDadYU5GUopOexrKgSELSMdMIRU
	 IOt40011VieejLjkwvuYhEtys10n7vkRCLDb/pjdd8y0nTORWbIaqcoWLHvPvElS00dNT
	 1KLlmg4lpS+i2pb1QrmDRrYmOBheW4dR25M5NVh0G1bqCnkUOCQwcj3Fm5Bkv4NG0xnep
	 xl4kQuh3IfQGbFmRzNISm/gkYx5sZiXli23y5USup9JJIdda8ajDoCMe72Cpv9/2RFvC1
	 Ok74FHPdTTbtrHMo1dpigFtMffYewEWTXB0LWgQ5hDpfBzqS+I6bsonoB8j9yEPgfCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lXs4zAc85AsFqIhTa+JCtj2Zz8CKIByhdaGIc/+HrUs=;
	b=YNpBsZBh5OnTEkuu4I12VRY6cf+w/eNwqSFufl6kPOdLc7P9Rkp/uOMYJPy0o47N8AHU
	 u+PAJEm1ggzQFtmufSpAbahRmOWkaD0JnlMwYuXG6OLWFJrc0jR/3Hr4NbRctJeARl+i7
	 SmGhfx1KEopMm327P2mt0rYZh6GMqZplKNN4kz+BPTqKy3h7Z42H+vSG7MHm0VIRsDjRg
	 K+SXEaRq5oBpXzom27eLezQPt2018Ckt04F1HZYl1ypsLbm6xiE17AJEyxYD5zw69zBg/
	 Cg9K9g3gXshDHgpupmPoVDtNSeUXqokIsz1fkw2BmVgx8mHUEQBhOUnTPBfoWLSO/Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=adevBwaW;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCD3606A324
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 12:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCCD3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=adevBwaW
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-497614c95f0so1374412f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 04:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795092691; x=1795697491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXs4zAc85AsFqIhTa+JCtj2Zz8CKIByhdaGIc/+HrUs=;
        b=adevBwaWYBc0lOMo/wTlrM8Y4vJH0u7Vdsu84uznjSm7Ut2vuKc3HCVYo6New3sxh9
         OYnhctmUpUPLchaqXA1gyr50XmiQmSAWOiZ6YMcXEBbhgIrM0kUGY0MP8P4sHa6IXhG/
         AznG5112LyaYHnfbFSS+RP7XVxrreb8WDxKwLk6P99Avkhf6viudhzd75vx9rcVkHlDp
         QPVEnPWLmoHBX2XHReWdZmVT0usuhJ8JgK8qZmerpahdPd/et6dmO1nIDIjl82U41Kht
         aCsFArH8koHqAfKDsWAcalrxpo21wHTAhxqkgie+lxZfcD1ZP0hiNxfCtx5i+s0HOkmo
         TifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092691; x=1795697491;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lXs4zAc85AsFqIhTa+JCtj2Zz8CKIByhdaGIc/+HrUs=;
        b=S3jYgJaA7dECtYp32YLKy1488sBh5NyFX/jyzhwtQ9MI7skFAFXogrWPzNLhjqLjxQ
         fOA7erVSdHsrL3kOguknPRHVvDBbpxTi89uDObQ9IT09tuo1JBXZTFsMu8t4jkuzvo82
         xkZ+9sMsQUxO2/xQ2Ch4VMlrPeBLxWZYfxUP5sbwaSfFH292zLiFPRSHdcQoMipLNdDw
         B1k18h1WaBpFbav5twxqZDexnEU/jeppKyq+9X5KAIVMZcKRKkxUS+dUfJnL0DdgzIW1
         +pYNj7PZl/VANr7JRD7khhT081RA2bIXCTP3RsFEvf3eqEFc4v3dKC8y190mCrPga55g
         SBCA==
X-Forwarded-Encrypted: i=1; AL+hErFf3OGud4xwXHRtU9c6F2/mIeUJiLQqriQwGi2BfZiL1HvysYa6D+afWDDFPzJmBGgNspiUuGrFBjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z98rusDgRB1Z/05E7UMGSVI0bVjwOPymxtjwFGyomB5cqv1UJLl
	barl2lBMj89TPpoRr+qx4am7GT+/sfcuakbxBAB70Y+PUDbNS6BYpLW0yEAVUW886X8=
X-Gm-Gg: AZFdTZcDavXrWGNR3Y5Wc2kLO38H6Ex0v31P8Nh9xuGuSYwZi9TdAXv5w8PECQmbylE
	VXGuOcl2bxX7la7au5hy+8lELVC5JbQKAJCRoob5VLCEFK3z7vfymZFNz7dYqjlMo3KbThBBIcD
	2kwqb5qXM5tzLDUoCpmGqPAzhnLf0AytWcRtut5Ao2sp9vnf2GNhIik5I0JG7Zo68/kJZMYCVaL
	2VJKgrEcHeHY0aGxD+OavWcoKtCkF7GrOfcQSD8UVAm9Y0y485HmLBIv9ye6x8e5mHZCauUdehi
	aVR8C/xlRpYJKaeqT1g82D+sQmrDiyFyltZgNz4Mn1SY5hMYmtRwa+DZMsDL9aX5MGtNDBqNur/
	XRQckbIccIuDN/WMyWcmaoAUpmQBHeem3lWfHhM9nzKWJotOYp+9dh0Jzg6khIVIWcBeHDEnraE
	W0RDhj/YOoWFAafr7F5e1z0xCRUrefjBqPyca6kwLUTZiY7cZpmee55Ac3CteS2/TW7IJm9oZ+J
	aDy3EKI6rO/t9NH43xmFchdlt0EtKwLnbELo4WZO/3Vfpi/oUcuaUN2RWzOquWB4aoGLQN3yMjj
	eJQOs170MLcpqoDD9R4RzyeJzhoNLVsvcZMmiXsGokI+AeutaaLA/Uu4SY/2wanzA38i
X-Received: by 2002:a05:6000:2dc7:b0:4a7:518f:bea6 with SMTP id ffacd0b85a97d-4a7518fbfe3mr11572846f8f.28.1795092691185;
        Thu, 19 Nov 2026 04:51:31 -0800 (PST)
Received: from ?IPV6:2001:a61:13e6:9f01:eee3:1629:f0cc:42a? ([2001:a61:13e6:9f01:eee3:1629:f0cc:42a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095e98sm9240494f8f.42.2026.11.19.04.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 04:51:30 -0800 (PST)
Message-ID: <e3956050-8b80-4270-998e-2e5ec70cbdf8@suse.com>
Date: Thu, 19 Nov 2026 13:51:29 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: image: microtek: don't receive REQUEST SENSE data
 into sense_buffer
To: Alexandre Becholey <alex@becholey.ch>, Oliver Neukum <oneukum@suse.com>
Cc: Oliver Neukum <oliver@neukum.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20261119084526.535901-1-alex@becholey.ch>
 <643a71e0-7347-47f3-8cad-ce31f76cb8af@suse.com>
 <AP57iwtzG1Kr6EB4hY7F0Hd-DaLhPZJzxoKNuvDpeiAKZvyxsddI1fl6kRKAc2Xg1ox0kL-KAdNYmZrRMEYN_mZRamfiV6nXjdcfDhJhGyY=@becholey.ch>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <AP57iwtzG1Kr6EB4hY7F0Hd-DaLhPZJzxoKNuvDpeiAKZvyxsddI1fl6kRKAc2Xg1ox0kL-KAdNYmZrRMEYN_mZRamfiV6nXjdcfDhJhGyY=@becholey.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19.11.26 13:28, Alexandre Becholey wrote:
> On Thursday, November 19th, 2026 at 1:02 PM, Oliver Neukum <oneukum@suse.com> wrote:
> 
>> On 19.11.26 09:45, Alexandre Becholey wrote:
>>
>>> The special case is not needed: for the error handler's own REQUEST
>>> SENSE, scsi_eh_prep_cmnd() already points the data buffer at
>>> sense_buffer with at most SCSI_SENSE_BUFFERSIZE. Handle REQUEST SENSE
>>> like every other data-in command.
>> Hi,
>>
>> thank you for looking at this, but this fix seems to not take an
>> approach I can approve. Where sense_buffer is pointed to is
>> internal to the SCSI layer. We cannot use that in an LLD.
>>
>> If you think that LLDs should not use sense_buffer then the clean
>> solution is to remove it from struct scsi_cmnd.
>>
>> 	Regards
>> 		Oliver
>>
>> NACKED-BY: Oliver Neukum <oneukum@suse.com>
>>
> Hi Oliver,
> 
> Would you take a v2 that keeps receiving the REQUEST SENSE data into
> sense_buffer and only limits the transfer to SCSI_SENSE_BUFFERSIZE?

Hi,

sure that would be fine.

Yet, I am afraid I have to ask why you want to solve this issue
at the level of the LLD? This looks like a generic issue to me.
The size of sense_buffer is documented. I don't see how this
issue can be limited to microtek.

	Regards
		Oliver

