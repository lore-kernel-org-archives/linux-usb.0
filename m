Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793591121;
	b=MQfXU63FID3Y4B1dKer1TvHn/rctMLO7aZnG7dlyylJKc6yiX0JRZYxxGNDIm7Y1B/UA
	 CYrmziDtrysfDimIQUpqIpSHSQopUVLDFqylw7IiAYTuvetqWLT73m3UWXnDqfO8iKUxs
	 P4Q5VzI0M7AXOlEH/9zsPIwCB74yhpadCEAM2JcHyoBzXYXX6b1YJiAcGAzusc3cKeCOU
	 FYcHIkddigmbqIP/FMBlyad1GMUXceSne8SOrMV+00q4JP8u2tmjz2A8b+p401uNfiMIK
	 SplpDfRFtOYP2P+n8unvMqg1q7NP8Yclh39FOUkDAWGtnf3VeUibdeCUh2ylgH5ekmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793591121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=thK/GTnCI6aU4GgyCtkZc/ZGtFI5CEa1YKDFDXhlzew=;
	b=SgRri7UXm9zfvU69PqcXi5MIcF8+YtwTKE4u2WAG2jQwJIa0f36n3aeXil/6fdO9SlZi
	 rMthFUZnvTkO4f/u2w90on+JtMTZjvnNuGctDmd7k0pOR4k5yM1ALa002jNYcasNtElYB
	 bVRaeEToEjEBJRCAboCuNICz/hBD49TI4VZ26PYj9HqUNw3tKBfpsAyGCjh2G127TUMPN
	 XUKGU6S5uRBy48hdX+EMW35TxK/IbIkWH/5pZ27+sdjz4KnaHGvCQmxlPygMac9RS5lPj
	 A5qroCuVi3RowkniOeFShFTS4AADAU95Ad/wby5VnfbpMBlu70sJ8FkWqrJuX+sL2Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BVFjeZZS;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1438C606A336
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 03:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1438C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BVFjeZZS
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-84abe8ecec8so1130209a34.1
        for <linux-usb@vger.kernel.org>; Sun, 01 Nov 2026 19:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793591120; x=1794195920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thK/GTnCI6aU4GgyCtkZc/ZGtFI5CEa1YKDFDXhlzew=;
        b=BVFjeZZSYXqx7Gs3BH3l+OE6VwNuHJ0YhCrxJdjSUlj8DcMarADLR8MP9CtIuyIzH7
         y9hszyzulP98siDw46ft1EZNA0bq4oZa5vTGo6p76D30qf4CCTiloc+1kJnj4QL2EF0j
         LdAE2xvy3v3ucp7WMqisviL8qW6qiOyPGBDCzxHOSfPoDbWZXIxnPmG+6x9ZNIKnLisJ
         QCovW6OAzXrG9PTbsHnBUmhD6GQqAmUarvPmPCXJuyZms8fFFLkRm3YalKuATXAZ3mAX
         nj2GF0xHsytE7hriAqtHZenbORvrF9rXOTXDWkc+vdfH0BS9na0TElO4OI54ID7C0b5Y
         bZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793591120; x=1794195920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thK/GTnCI6aU4GgyCtkZc/ZGtFI5CEa1YKDFDXhlzew=;
        b=1pM0CsnxG0OTP1WQP48H+rJSrqqZhAVM15QiSI2AAhdBtfqk05w8/pIuKl1Lj2nws3
         N9Cqp8ROYCwpJ0I+uJbu6tok7RhIXKZXEJdR7ZFUm8fObGk4eUWlUY3hVrzt+0QJAN6g
         3/4HyqVo8ONQcKflbnEttVheHrUhmu3cdVeae0qMnsyMp8FMXDkqRoWwGIO/VD53WjsC
         iH1lL/rMk1QEDjPKOK0A36lxfOgkTW/zqilYY5YDnNn0XIf522tOyGxHB3eb6fRbBB0V
         pFhbQJ2JkxlljeECxKvNYz562cEkawq/8xH/mCSe0LB0bkUGAlKb1Xqahs84dyaPo9hw
         8Y1Q==
X-Gm-Message-State: AFq9FYLe0IJe70okA1S4BKf+s0CSaX7aUsJLlVEYkCeJdWhZ3rAxPUxt
	tTYmCYsh0ikOSqFbJApZu5wbf7MGhTko5OJPQHQPLXdeuc8qI4/ROItF
X-Gm-Gg: AYBFou0TJ4/+oMigLSAaqs0Ii745JqmKVCbVp0ZFuQU4KDgO+l9dOS+FT+zOvu8zCwz
	0HAkrfUpBDxMSjSHs6BcnTga0plSN7QusZZsaDaggRAr2vsxVXWb4QOUOFW8QZVxmEefYqbJCio
	eXiNqgdA7dryRqm0E29oI0wEF/rY03H+kZUf1ZgB80he1oR1dtHl8gbHHDQV8Dsfhr2i6gMTTQl
	GRVtYdSObma9emElnFIFtKVbRsuTknuy334EIefg+pibPNNmDvuC6G+tR6uAC6/mK1KAnfRSHtR
	c51Xt3qZkSg6hJssmf7f+NlwliiEk1qGsqm2+FGOJNVaDFKzKs0DLCKjzIhdmDxrZ/N8tdOpsrN
	y/NrQxRMrH9ucZ8X3MTgWa6CHEZXXRxGVif/ur0K1vSaL3WhmRP28fJMRqlARt4re1eS9e+1vvV
	yvOSbHHOKINispdhkIQ3fGFfqD6D3OMWt4piyYCOsEIm+EY5FNYvwj5+Igrxnsbwt+55BljVGuW
	8TVjYAgJzhP2rM/w5HifZ3oIpAxSHSJQoumtFxcdd12oMimqlioGTlBj2RShl3pKtZmrJEmqL4H
	uEVW4JC0lIBcYlKEgARgqgZYnrOjE3TiW9fYGvr8aJVu
X-Received: by 2002:a05:6830:4116:b0:81a:9522:f007 with SMTP id 46e09a7af769-85d3649508amr6210396a34.5.1793591119902;
        Sun, 01 Nov 2026 19:45:19 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354d2059sm8172551a34.18.2026.11.01.19.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 19:45:18 -0800 (PST)
Message-ID: <b0c42b21-6b28-49fd-ac07-7af1456de4b9@gmail.com>
Date: Sun, 1 Nov 2026 21:45:16 -0600
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
Subject: Re: [PATCH RESEND] usb: mtu3: don't run gadget completion callbacks
 with interrupts disabled
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260929-usb-mtu3-gadget-completion-callback-fix-v1-1-8b75b48fab96@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260929-usb-mtu3-gadget-completion-callback-fix-v1-1-8b75b48fab96@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Greg,

Gentle ping on this one too. Similarly has had no comments since the 
resend on the 29th of September.

It fixes the softirq WARN in the commit message, which any gadget 
function that reaches netif_rx() (u_ether in this case) hits on mtu3.

Thanks,
Ryan Brue
