Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307690;
	b=addFLLWStFsIo7Jtv9OSODlmiqkv8GLAfI8Kg/nauxEC2iMNBbdT/F5gfXdrXX0eZh3v
	 ClFLkNqSdrJ3LZn8jBqHd42hGH3cJ30Y1iL0l3G63BUf5s6KBR6fdbrso4/4K3n8XzhSJ
	 yTPgmYoDZP/x0B6R8AKu5drmSDjGjo3vSOy3Od0QJCic8GexJVTVMtus2WtvguXYDtEBO
	 VGxGmU6P+Kax92WUj0fC2DVBmxaGSzooQKFata4cAZNf4PAIGS5Lc3J6Kjd0F+E/55jfx
	 KkaeRhYc1ijJa7qeV8dCYHvAp1r8qozc/1NfiI+ay6NYt3BOtBaNrszD7YVvOzaHVLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To;
	bh=AsVpshVWUcahAJco6yGQFmBOgaw87iAoLtHAaOYVCFs=;
	b=eq8wuNf2f+SwRd6Ql0NjX2dYQVior8UflSRJkV8LnU+pjaNM5YDSNRsv9+/XLG5s5Mh1
	 LKaOCzjHcyV4crVNKSOOIVIk4bT28NFCr0qTSEcLpHQCXuNMBvaizl/uRZ5Tw1nHrU+pb
	 o8N0X2DLPYcxMHW64SBv81esJDR92ryan5sio1Qx0YcEdiaUdV7vxD2uBRsQKKnyc/AaJ
	 +stzpq1dyohiol7RpbYXbSuYdn9f1vEwENb99wW+lUnd5wBFOvtbv4GOYSM8BG76IdAp6
	 +SGv8wvZKScR0RDWmoJCTbAQsQxzrkUymQhcnqsduDoKEnWg7b3Jeku53BrDFJLqPKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FJ+yNBRx;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E783606A32E
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 10:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E783606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FJ+yNBRx
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso19818745e9.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 02:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794307688; x=1794912488; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AsVpshVWUcahAJco6yGQFmBOgaw87iAoLtHAaOYVCFs=;
        b=FJ+yNBRxyJI2z7b9ifd1BlWgPyDujuP2bucSCxdd2jMCCs2Vq+y4Fg1q2qXXeVscn9
         EDBeZTKKPxc5cwKpQ1zbptmVdrVEaBhQbEPKjLOB8gDdBVuC6cmkvy9rE9ba1e+7Qkci
         DncEFa7RlS3gf5l8G33OgqHGfOasXBPTLKjqVLP19T4YyGzT5srN2n7zvsO9zQNUemSK
         yIFXayt+0HJrSNQa8igR1kJ6445w0Q7c89bEdbaBgIK2G0a1kkn8yPuiFaQBxYdMuVw3
         dRLQOPVCONqsVm+QcYaSrdtXPjVawC8Ehaf1Eu5PNMDhKdU6bbf5EdA+6oRIbTvo+WFR
         biHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307688; x=1794912488;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AsVpshVWUcahAJco6yGQFmBOgaw87iAoLtHAaOYVCFs=;
        b=ZTOWVCT+8ZbWnrurULUTRYYCG/8Gj6zOAuld+dM0z+sY2rZL1EzaGqC7BVJ15BXBg9
         Bg63pkZdUdoHvUnh6d4BkZ5XvtvdOH1SseCfPLhvxdIX5jKMcson3q1prALf59VKAet+
         TxkiIuDzz+eDA3vvs9hFGvxr7Aj73OeW2DgjRNAX9P4Rx3XZo1ZLHDEWGC/gcxyXotC2
         iEdxabzPum9zfnnvlZmV5EpVkKje5rUmiWI0KWm3/NjNdInZJ3/R7U9DbMYPw2FMKo8g
         EEhRqKT+0TC96Nk9doQgkDFQ6o1FKugq8CaeE/KjdlYkvMD38CFdqKIxOOEyZTBNafVa
         8xdw==
X-Gm-Message-State: APuU4Z99d00ENWKfpAzxUJbB8UewsB2gDBwAW9sMtguw0+IFLt3IwnDo
	qtNC3ebSjkS5F+9oMwGiGw+847ODhIh+hNqgkHVWcTeKLfG42IRF1SRnsAsYGBj9gQk=
X-Gm-Gg: AYBFou2vT4PuaGYdzAcEL+54LF3n4e7OS3k6A152wdfN99FCaisfBObdsXajz51a2p4
	npKqe/adMM96Hpl8YM4bB7wPKjn3h2oTQ5dHIBdGa8X5KDDVMkmCJydTOVX8GbFC51PJy/Jg6OM
	oCRsXVrrKx+m03yWeiDPqFgE8SuAfPu4RoBv/sYn/xX/yMYSfvGjonUiX+OPpSyMo1zSk90PFc5
	9OKwmcxcJbTm9awOXYTzJl5SsLWqL0zkexbj/RGlfqXY1kAfM3iyvcuI6EtZPe4m6N5rsH4V2z7
	1LbQg7vVS61hUic4zPdpnV9noEcULWQ6PsJJhtBeP4on6T+Aod7al6B+vbQXNM5/OSymUxo6N4r
	ZgN/aA4kX+mBAUsW3RBMtTcGGpeslxIvb4dEaEFZkxupR3POtN0vi70jf3gIY8Me+zVbCS/I/Hr
	nDmEE8AzrsjQn52GIC+0/O/pgCexNBcWldp782hZqhb5r4wmOBuhmOYrgaZimLahmqFSMwc3IaI
	4MNggckHVbgji/qIGEiVSWxFAOJIYVs2XpKT8bd6HLn1YakbfgpqoW1QKZQ+sRxwW1CVxufY6Qo
	K3hOibfJ9etm7Hxa1+a6ObFONEdRp9g20Lr1D//PQIp/5IZPSkjL+SqkcnzRaBYLS+kGGw4G
X-Received: by 2002:a05:600c:348d:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4ba023051a5mr35822815e9.1.1794307687833;
        Tue, 10 Nov 2026 02:48:07 -0800 (PST)
Received: from ?IPV6:2001:a61:1365:2501:d97e:4bec:d495:3c3f? ([2001:a61:1365:2501:d97e:4bec:d495:3c3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204ee67sm57409875e9.13.2026.11.10.02.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 02:48:07 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------lieuYdQrnBx6m16xWGNncEST"
Message-ID: <a26ce7f8-e2df-4d1b-a22f-1787126ca989@suse.com>
Date: Tue, 10 Nov 2026 11:48:04 +0100
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
Subject: Re: [PATCH net] net: usb: rtl8150: fix rx tasklet use-after-free on
 disconnect
To: Myeonghun Pak <mhun512@gmail.com>, Petko Manolov <petkan@nucleusys.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Ijae Kim <ae878000@gmail.com>
References: <20261110043016.56986-1-mhun512@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261110043016.56986-1-mhun512@gmail.com>

This is a multi-part message in MIME format.
--------------lieuYdQrnBx6m16xWGNncEST
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.11.26 05:30, Myeonghun Pak wrote:

Hi,

> Kill the tasklet again after unlink_all_urbs() has waited for all
> completion handlers. tasklet_kill() drains any late tasklet and prevents
> self-rescheduling; disabled endpoints prevent it from leaving an RX
> URB in flight. Keep the first kill to stop an existing reschedule loop
> before unregister_netdev().
> 
> Found by a static analysis tool under development.

Good catch; nice tool.
But the fix is not correct.

> Fixes: eff674a514bd ("USB: rtl8150_disconnect() needs tasklet_kill()")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> 
> ---
> 
>   drivers/net/usb/rtl8150.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> index d51e43170e03..98c36c377956 100644
> --- a/drivers/net/usb/rtl8150.c
> +++ b/drivers/net/usb/rtl8150.c
> @@ -971,6 +971,8 @@ static void rtl8150_disconnect(struct usb_interface *intf)
>   		tasklet_kill(&dev->tl);
>   		unregister_netdev(dev->netdev);
>   		unlink_all_urbs(dev);
> +		/* A completion may have scheduled it after the first kill. */
> +		tasklet_kill(&dev->tl);

The tasklet, however, can also submit the URB again, which in turn
can submit the tasklet and so on. There is an unavoidable window
in that sequence, as tasklet_kill() will kill the tasklet, but it may
have run in the window.

Hence you need to also, in addition to your patch, actually prevent the
resubmission of the URBs. The attached fix will do so.

How do we do this? Shall I submit? Do you want a joint submission?

	Regards
		Oliver

--------------lieuYdQrnBx6m16xWGNncEST
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-net-usb-rtl8150-break-cycle-between-tasklet-and-URB.patch"
Content-Disposition: attachment;
 filename*0="0001-net-usb-rtl8150-break-cycle-between-tasklet-and-URB.pat";
 filename*1="ch"
Content-Transfer-Encoding: base64

RnJvbSBjOGI4OGQ0NWNhZWYwYzJmZGZhMGIxYTUxZjc3YzJkYjU2NzY1OGJmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBUdWUsIDEwIE5vdiAyMDI2IDExOjI2OjM0ICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gbmV0OiB1c2I6IHJ0bDgxNTA6IGJyZWFrIGN5Y2xlIGJldHdlZW4gdGFza2xldCBhbmQg
VVJCCgpUaGUgdGFza2xldCBjYW4gcmVzdWJtaXQgdGhlIFVSQiwgd2hpY2ggaW4gdHVybiBj
YW4KcmVzdWJtaXQgdGhlIHRhc2tsZXQuIFRoZSBjeWNsZSBuZWVkcyB0byBiZSBicm9rZW4K
dGhlIHNpbXBsZXN0IHdheSB0byBkbyBzbyBpcyB0byBwcmV2ZW50IHRoZSByZXN1Ym1pc3Np
b24Kb2YgdGhlIFVSQnMgYnkgcG9pc29uaW5nIHRoZW0uCgpTaWduZWQtb2ZmLWJ5OiBPbGl2
ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgotLS0KIGRyaXZlcnMvbmV0L3VzYi9ydGw4
MTUwLmMgfCAxNiArKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC91c2Iv
cnRsODE1MC5jIGIvZHJpdmVycy9uZXQvdXNiL3J0bDgxNTAuYwppbmRleCBkNTFlNDMxNzBl
MDMuLjYzNWU2NWEwZGU0MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvdXNiL3J0bDgxNTAu
YworKysgYi9kcml2ZXJzL25ldC91c2IvcnRsODE1MC5jCkBAIC0zNTMsMTEgKzM1MywxOCBA
QCBzdGF0aWMgdm9pZCBmcmVlX2FsbF91cmJzKHJ0bDgxNTBfdCAqIGRldikKIAl1c2JfZnJl
ZV91cmIoZGV2LT5pbnRyX3VyYik7CiB9CiAKK3N0YXRpYyB2b2lkIHJlZW5hYmxlX2FsbF91
cmJzKHJ0bDgxNTBfdCAqIGRldikKK3sKKwl1c2JfdW5wb2lzb25fdXJiKGRldi0+cnhfdXJi
KTsKKwl1c2JfdW5wb2lzb25fdXJiKGRldi0+dHhfdXJiKTsKKwl1c2JfdW5wb2lzb25fdXJi
KGRldi0+aW50cl91cmIpOworfQorCiBzdGF0aWMgdm9pZCB1bmxpbmtfYWxsX3VyYnMocnRs
ODE1MF90ICogZGV2KQogewotCXVzYl9raWxsX3VyYihkZXYtPnJ4X3VyYik7Ci0JdXNiX2tp
bGxfdXJiKGRldi0+dHhfdXJiKTsKLQl1c2Jfa2lsbF91cmIoZGV2LT5pbnRyX3VyYik7CisJ
dXNiX3BvaXNvbl91cmIoZGV2LT5yeF91cmIpOworCXVzYl9wb2lzb25fdXJiKGRldi0+dHhf
dXJiKTsKKwl1c2JfcG9pc29uX3VyYihkZXYtPmludHJfdXJiKTsKIH0KIAogc3RhdGljIGlu
bGluZSBzdHJ1Y3Qgc2tfYnVmZiAqcHVsbF9za2IocnRsODE1MF90ICpkZXYpCkBAIC01MTgs
NyArNTI1LDcgQEAgc3RhdGljIHZvaWQgaW50cl9jYWxsYmFjayhzdHJ1Y3QgdXJiICp1cmIp
CiAJcmVzID0gdXNiX3N1Ym1pdF91cmIgKHVyYiwgR0ZQX0FUT01JQyk7CiAJaWYgKHJlcyA9
PSAtRU5PREVWKQogCQluZXRpZl9kZXZpY2VfZGV0YWNoKGRldi0+bmV0ZGV2KTsKLQllbHNl
IGlmIChyZXMpCisJZWxzZSBpZiAocmVzICE9IC1FUEVSTSkKIAkJZGV2X2VycigmZGV2LT51
ZGV2LT5kZXYsCiAJCQkiY2FuJ3QgcmVzdWJtaXQgaW50ciwgJXMtJXMvaW5wdXQwLCBzdGF0
dXMgJWRcbiIsCiAJCQlkZXYtPnVkZXYtPmJ1cy0+YnVzX25hbWUsIGRldi0+dWRldi0+ZGV2
cGF0aCwgcmVzKTsKQEAgLTc1MSw2ICs3NTgsNyBAQCBzdGF0aWMgaW50IHJ0bDgxNTBfb3Bl
bihzdHJ1Y3QgbmV0X2RldmljZSAqbmV0ZGV2KQogCWlmICghZGV2LT5yeF9za2IpCiAJCXJl
dHVybiAtRU5PTUVNOwogCisJcmVlbmFibGVfYWxsX3VyYnMoZGV2KTsKIAlzZXRfcmVnaXN0
ZXJzKGRldiwgSURSLCA2LCBuZXRkZXYtPmRldl9hZGRyKTsKIAogCXVzYl9maWxsX2J1bGtf
dXJiKGRldi0+cnhfdXJiLCBkZXYtPnVkZXYsIHVzYl9yY3ZidWxrcGlwZShkZXYtPnVkZXYs
IDEpLAotLSAKMi41Ni4wCgo=

--------------lieuYdQrnBx6m16xWGNncEST--
