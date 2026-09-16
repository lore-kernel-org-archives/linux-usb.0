Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DD53BA225
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 18:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789582537; cv=none; b=H2utRRERYFpZUT2o2g1Mk3771rkBatd6/R1Pz87+SIF85Vi1tktmEe44XqAmNIsZjD256RnC4O0M9OgCCQRIDVJG3QEZfjx0Us1a3QQX82CzE1s+q4bt3UKwpZsTQ6O+ssSd1jd8ulccS8Vhh6CGqpn4c5pyCQ5IA1u72Jzr4GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789582537; c=relaxed/simple;
	bh=dSCqGgYRwdYm3xNWISQSdyfDzLRDfEZdXIIMlDmoWSU=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=ZCL8uw87AE3iQVDB6pansEeVrchImqI1CzSBJ5wJ5bZP+1LA0nAojU/JA+w0SxbjZlPE4AILiAFFN7+YfuA1O4oEY4+k1G5TjltJZnNAPa71PzovjZcaXyW+4I/v6WvSlG6knFosICCOIL26MsWtYgH2bjXQY2xhyCcnnLdcmB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EWmNkSM9; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EWmNkSM9"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so426465e9.1
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 11:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789582523; x=1790187323; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FYx9isMMr8aF+/2UYelOTScXJOAkcODXeEKi0uXPtyk=;
        b=EWmNkSM90lG/CZsoKQvEyrmQSsrXwqRT+2h9sYtdUVm1/gEGXnYQFIEbSQZLol4BQO
         3kHHwWhbcxl68Xcvooi2wP56DlePHZsCfNQpweyOQI9TYlRqNo5hjshZuoKWBbHYryMO
         Dikrq8LiSxJt6yfHHDPuSVow+IpcpXhcHmk8NTJpZCgCu8laQgbiOWkRqDzt0zmz3Wkj
         t/f7cX+pVhfNH1hD3Vf5QRlAQ6Iwt3hw8Ru8gaWiJPNYbAdLad+87bMOsqDmBQCsCwYo
         tqe3YbGCQ9q3cwVG2pzsjChi+enLDFhTUw37vqrBtd4DbrLwdzwWaGPgKx63cv2M0KkQ
         5ChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789582523; x=1790187323;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FYx9isMMr8aF+/2UYelOTScXJOAkcODXeEKi0uXPtyk=;
        b=ImJ3FPuGfwo5GJ9sIVCD5XXTRlSoEJ8AcKJRS72EXzE/GmE8HEtJ9X06j1Nc4WBW10
         S/VQBzodMiLoS5XKkVFdhueVIEIUUINrI7FZ+LIlGUBvo2DViNJwJzmVmb+051wyn1GL
         IMrwC9dH0eclLDaLJQXNflJtR9zBTtuIRQ7UfW6Gt7sDK4GqaZjRnKTHuujdso4uEZ0a
         kErZ2dhdBWkYuHu9cZTrbIDNFAH3bizUHaQVFVucXPJjIppimcZFmZPPyMVRFzvvvKew
         MKpd8XBBbbgpY8P7i+ALSCdkdOAM22OX/b4yuePgOD2iwTn5iMp4md3Y4i9oHJpBTCnC
         JOtw==
X-Gm-Message-State: AFuF++kxtg4AJXJ8N7iyCBSi6BExOZlQ+vPsGs7uzHmedvCV81czXLOA
	YabzM12T1MYrEljyemDnNFDLIgjBsTsHWm9zWnwLE5NgBZpJjQrDoz7ieKtTpVzs71s=
X-Gm-Gg: AYBFou08LW31ZbF42o0Dl59ugb3XYXC4ZB0MWJu9lRXW56YDHgLaDoREE5x9Al9Ldg2
	OY5W9/t7aXqUJbaSEP1YHuOUeoHdcX5cA+SgSGRSrYKNzRlqIHlpd+fVdTrZNCJpTVoVx9xAHpg
	Xf5rPErqBOD9Tpl2tI6fn5IZB4iDfvELbUE/Ilw47YHaJs7E1dgZNiMcHNRxGvXZ44avsLuJYEu
	cT3ovLTM4v+iR9Jkw9G7Jt4Z8bo9aIHkMGC2v1H2Ehqu9bIDKLN76nrGUmVPcB0p2Cvq/6tZ6nQ
	u7iuSJ0+6bS4NniML6hqPjaSzx4D/AlN3cwORyIsvxGEQGSRDbGUCkTkhtBS6PW9R+ZLVz3csLi
	STepJ0KFMXshYISE7ptVkkJzSHFBRelQDkLVUeq+XjXu51914pP5DlPU4w3EgmkNXOX8s8wrMSl
	5EekazFcpBDfr2OTWyQz/D8zmIzXoktjwBrv45OQv0QzSPlbYP1r6sWza3zCKEuSrgqmToH2M6X
	5QsguuIDlVbTbG85b34qagAu5A281p9Vqjqd+I5vg==
X-Received: by 2002:a05:600c:4505:b0:49c:fc6e:8cae with SMTP id 5b1f17b1804b1-49eb73475efmr44858405e9.18.1789582522693;
        Wed, 16 Sep 2026 11:15:22 -0700 (PDT)
Received: from ?IPV6:2a02:3035:b61:cd4c:428e:991d:75b:c0b0? ([2a02:3035:b61:cd4c:428e:991d:75b:c0b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd32c5e1sm15131045e9.5.2026.09.16.11.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 11:15:21 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------XEnvVPO2Q6hJ7Mw5RBTj5USZ"
Message-ID: <9e4b67a2-1975-43a6-b79f-00ad833c4214@suse.com>
Date: Wed, 16 Sep 2026 20:15:20 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] usb: mdc800: possible circular locking dependency between
 io_lock and minor_rwsem
To: CJ <firefly0158@163.com>, gregkh@linuxfoundation.org, oneukum@suse.com,
 n7l8m4@u.northwestern.edu, kees@kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5c30f641.6b79.1a09ed8b2bf.Coremail.firefly0158@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <5c30f641.6b79.1a09ed8b2bf.Coremail.firefly0158@163.com>

This is a multi-part message in MIME format.
--------------XEnvVPO2Q6hJ7Mw5RBTj5USZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14.09.26 09:36, CJ wrote:
> 
> Hi,
> 
> 
> I am reporting a lockdep-detected circular locking dependency in the mdc800 USB
> driver, triggered by a syzkaller USB reproducer.  The issue is reproducible with
> HEAD commit cee9395acd8043be0644b25c34bfa86623f2b935 (v7.3-rc1, Linux
> 7.3.0-rc1).
> 
> 
> The reproducer connects a synthetic USB device through dummy_hcd that enumerates
> as the mdc800 camera, then opens the character device node.  No filesystem or
> image input is involved; the trigger is the connect-then-open sequence on a
> device that binds to this driver.

Hi,

please try the attached patch.

	Regards
		Oliver

--------------XEnvVPO2Q6hJ7Mw5RBTj5USZ
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-misc-mdc800-avoid-circular-locking.patch"
Content-Disposition: attachment;
 filename="0001-usb-misc-mdc800-avoid-circular-locking.patch"
Content-Transfer-Encoding: base64

RnJvbSAwMWU0YTViN2YyMTViNWY2OWVjMWZkZGU4MjljMWNkMDk0OThhMjJmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBXZWQsIDE2IFNlcCAyMDI2IDE3OjM3OjI1ICswMjAwClN1YmplY3Q6IFtQQVRD
SF0gdXNiOiBtaXNjOiBtZGM4MDA6IGF2b2lkIGNpcmN1bGFyIGxvY2tpbmcKCk5vIG5lZWQg
Zm9yIGxvY2tpbmcgaW4gcHJvYmUoKQoKU2lnbmVkLW9mZi1ieTogT2xpdmVyIE5ldWt1bSA8
b25ldWt1bUBzdXNlLmNvbT4KLS0tCiBkcml2ZXJzL3VzYi9pbWFnZS9tZGM4MDAuYyB8IDI2
ICsrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCAxNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9pbWFn
ZS9tZGM4MDAuYyBiL2RyaXZlcnMvdXNiL2ltYWdlL21kYzgwMC5jCmluZGV4IGY3Y2FhMWM1
Y2JiNy4uOWVkZjBhZmU4ZGFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9pbWFnZS9tZGM4
MDAuYworKysgYi9kcml2ZXJzL3VzYi9pbWFnZS9tZGM4MDAuYwpAQCAtNDgwLDE1ICs0ODAs
NiBAQCBzdGF0aWMgaW50IG1kYzgwMF91c2JfcHJvYmUgKHN0cnVjdCB1c2JfaW50ZXJmYWNl
ICppbnRmLAogCiAJZGV2X2luZm8oJmludGYtPmRldiwgIkZvdW5kIE11c3RlayBNREM4MDAg
b24gVVNCLlxuIik7CiAKLQltdXRleF9sb2NrKCZtZGM4MDAtPmlvX2xvY2spOwotCi0JcmV0
dmFsID0gdXNiX3JlZ2lzdGVyX2RldihpbnRmLCAmbWRjODAwX2NsYXNzKTsKLQlpZiAocmV0
dmFsKSB7Ci0JCWRldl9lcnIoJmludGYtPmRldiwgIk5vdCBhYmxlIHRvIGdldCBhIG1pbm9y
IGZvciB0aGlzIGRldmljZS5cbiIpOwotCQltdXRleF91bmxvY2soJm1kYzgwMC0+aW9fbG9j
ayk7Ci0JCXJldHVybiAtRU5PREVWOwotCX0KLQogCW1kYzgwMC0+ZGV2PWRldjsKIAltZGM4
MDAtPm9wZW49MDsKIApAQCAtNTI2LDcgKzUxNywxMSBAQCBzdGF0aWMgaW50IG1kYzgwMF91
c2JfcHJvYmUgKHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRmLAogCiAJbWRjODAwLT5zdGF0
ZT1SRUFEWTsKIAotCW11dGV4X3VubG9jaygmbWRjODAwLT5pb19sb2NrKTsKKwlyZXR2YWwg
PSB1c2JfcmVnaXN0ZXJfZGV2KGludGYsICZtZGM4MDBfY2xhc3MpOworCWlmIChyZXR2YWwp
IHsKKwkJZGV2X2VycigmaW50Zi0+ZGV2LCAiTm90IGFibGUgdG8gZ2V0IGEgbWlub3IgZm9y
IHRoaXMgZGV2aWNlLlxuIik7CisJCXJldHVybiAtRU5PREVWOworCX0KIAkKIAl1c2Jfc2V0
X2ludGZkYXRhKGludGYsIG1kYzgwMCk7CiAJcmV0dXJuIDA7CkBAIC01NDgsMTUgKzU0Mywx
MiBAQCBzdGF0aWMgdm9pZCBtZGM4MDBfdXNiX2Rpc2Nvbm5lY3QgKHN0cnVjdCB1c2JfaW50
ZXJmYWNlICppbnRmKQogCiAJCXVzYl9kZXJlZ2lzdGVyX2RldihpbnRmLCAmbWRjODAwX2Ns
YXNzKTsKIAotCQkvKiBtdXN0IGJlIHVuZGVyIGxvY2sgdG8gbWFrZSBzdXJlIG5vIFVSQgot
CQkgICBpcyBzdWJtaXR0ZWQgYWZ0ZXIgdXNiX2tpbGxfdXJiKCkgKi8KLQkJbXV0ZXhfbG9j
aygmbWRjODAwLT5pb19sb2NrKTsKIAkJbWRjODAwLT5zdGF0ZT1OT1RfQ09OTkVDVEVEOwog
Ci0JCXVzYl9raWxsX3VyYihtZGM4MDAtPmlycV91cmIpOwotCQl1c2Jfa2lsbF91cmIobWRj
ODAwLT53cml0ZV91cmIpOwotCQl1c2Jfa2lsbF91cmIobWRjODAwLT5kb3dubG9hZF91cmIp
OwotCQltdXRleF91bmxvY2soJm1kYzgwMC0+aW9fbG9jayk7CisJCXVzYl9wb2lzb25fdXJi
KG1kYzgwMC0+aXJxX3VyYik7CisJCXVzYl9wb2lzb25fdXJiKG1kYzgwMC0+d3JpdGVfdXJi
KTsKKwkJdXNiX3BvaXNvbl91cmIobWRjODAwLT5kb3dubG9hZF91cmIpOworCiAKIAkJbWRj
ODAwLT5kZXYgPSBOVUxMOwogCQl1c2Jfc2V0X2ludGZkYXRhKGludGYsIE5VTEwpOwotLSAK
Mi41NS4wCgo=

--------------XEnvVPO2Q6hJ7Mw5RBTj5USZ--
