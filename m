Received: from forward501a.mail.yandex.net (forward501a.mail.yandex.net [178.154.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2904F1E5B70
	for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 07:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787384495; cv=none; b=jqtRhGWlR89k/m2D+pf2tZTVkSHvk3677yFT3o3fmtYfi3mgCeCwx32tXijKVJwDodNJ9XCn4ytlMcJPzFPmm5hU8StG+HpcTkhLYVLXUpMRDjQjznphfV9ynDBllVUKdNCVYB7tq97k8KkOUmRZ0l1AhwnXCQSjiwWfDzo4CLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787384495; c=relaxed/simple;
	bh=5mAzRCEYRhaocg8XqLXvjnsy+Su+AGzrVysjpoeVEkY=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=mD8L8Iv/b+5ogeZNuE5WUcnD0YB7B71jw+Yk+ztW5NgOIPHigkO/oMx9a+du9+hqcIbn3cDn20XYBAZLP16/Tf/9ntHfG/rADXTyvydiWgGjf6WxSseLUlu4hugA5GKJM9Ze7r4fsmvA5ScXN19z0i9cHyDE1+urCYbeOmSBKn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=CiWL/fdS; arc=none smtp.client-ip=178.154.239.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="CiWL/fdS"
Received: from mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:340d:0:640:ad51:0])
	by forward501a.mail.yandex.net (postfix) with ESMTPS id C16AB810B0;
	Sat, 22 Aug 2026 10:41:28 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net (smtp) with ESMTPSA id RfTSNoUf6mI0-KMJh0jgr;
	Sat, 22 Aug 2026 10:41:28 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1787384488; bh=T8gbKAfSQ7ljwVZTJNTLfSDtjVYeziGFUmyCLnkCAM0=;
	h=In-Reply-To:Cc:Date:References:To:Subject:Message-ID:From;
	b=CiWL/fdS8iv4+jzB//qEyGwtOhDAX30r+Sm6rnekoxcOM4bbRNBKi0AAc0Q5nHApa
	 vDmXvJytsXvkL/FSF+nngQ7dM9d1tilRYwtxRQ/RV8BFS6TJm5aFKNmSivMqm9Qomb
	 WV72O1hg4tQl0wNsmlcTSYlVaz02jmTUT+Sbj8RU=
Authentication-Results: mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Content-Type: multipart/mixed; boundary="------------92LoYnhMzpiVD0VDDrmTK1Nb"
Message-ID: <0ea518e1-8f64-4b35-8e0f-fc8ec0463491@yandex.ru>
Date: Sat, 22 Aug 2026 10:41:27 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] xhci: repeated URB cancel on UVC status interrupt EP (0x83)
 loops for ~15s, stalls camera - Intel Cannon Point-LP [8086:9ded]
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <1551785954451@mail.yandex.ru>
 <20260815215259.014cc324.michal.pecio@gmail.com>
 <fa17985f-fe64-4f23-9b71-9a244db2f64c@yandex.ru>
 <20260818000909.31af0ae3.michal.pecio@gmail.com>
 <358afe43-5f0f-41f6-89cc-129b20ef7641@yandex.ru>
 <20260818232945.2c67b15b.michal.pecio@gmail.com>
 <f4eb5fa3-3c91-4c7c-b709-b493a0563e66@linux.intel.com>
 <cd7e86de-f7e6-4cff-b171-24891ef30bd3@yandex.ru>
 <20260822092541.1bcc6dae.michal.pecio@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?0JTQvNC40YLRgNC40Lk=?= <senior.joker2009@yandex.ru>
In-Reply-To: <20260822092541.1bcc6dae.michal.pecio@gmail.com>

This is a multi-part message in MIME format.
--------------92LoYnhMzpiVD0VDDrmTK1Nb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michal,

Thanks. Yes, exposure_dynamic_framerate appears to be
V4L2_CID_EXPOSURE_AUTO_PRIORITY / UVC_CT_AE_PRIORITY_CONTROL.

I agree that the Linux A/B captures are not sufficient to prove that
this control directly affects the number of Missed Service Errors. The
results without tracing varied substantially between runs, from 3.71
to 21.08 delivered fps, so some of the difference between 4260 and
1514 MSEs may be run-to-run variation.

The Windows comparison makes the control interesting, but does not
establish the Linux xHCI mechanism: under the same bright lighting,
Windows delivered 6.95 fps with Low Light Compensation enabled and
29.88 fps with it disabled, followed by 40 successful stream restarts.

I repeated the 320x240 YUYV, 30 fps test with
exposure_dynamic_framerate=0 and successfully captured the uvcvideo
trace=0x400 output this time.

The run completed with rc=0 and delivered 300 buffers in 31.065
seconds, corresponding to an effective delivered rate of 9.66 fps.
There were 620 reported sequence gaps, so only 32.61% of the observed
sequence positions were delivered.

Despite the lower resolution, the camera selected exactly the same USB
streaming configuration as at 640x480:

Device requested 3072 B/frame bandwidth
Selecting alternate setting 7 (3072 B/frame bandwidth)
Allocated 5 URB buffers of 32x3072 bytes each

Therefore, lowering the resolution to 320x240 did not cause the device
to select a smaller or power-of-two payload size. It also did not solve
the practical frame-delivery problem. This result consequently does
not directly test the power-of-two packet-size hypothesis, because the
camera still requests 3072 bytes for this mode.

Regards,
Dmitry


22.08.2026 10:25, Michal Pecio пишет:
> On Sat, 22 Aug 2026 02:37:28 +0300, Дмитрий wrote:
>> At 640x480 YUYV and a requested 30 fps, with
>> exposure_dynamic_framerate=1, a normal 120-frame run timed out after
>> 45.034 seconds with rc=124.
>>
>> With exposure_dynamic_framerate=0, the camera is no longer completely
>> stuck, but the video is still not usable as a smooth stream:
> Not sure what this is, possibly V4L2_CID_EXPOSURE_AUTO_PRIORITY, which
> maps to UVC_CT_AE_PRIORITY_CONTROL. From UVC 1.1 spec:
>
> The Auto-Exposure Priority Control is used to specify constraints on
> the Exposure Time Control when the Auto-Exposure Mode Control is set to
> Auto Mode or Shutter Priority Mode. A value of zero indicates that the
> frame rate must remain constant. A value of 1 indicates that the frame
> rate may be dynamically varied by the device. The default value is zero
> (0).
>
> I have no idea what this means and how the camera is expected to keep
> constant framerate if exposure gets longer than frame period, or why
> wouldn't it keep constant framerate when exposure time is shorter.
>
> Not sure why this seems to affect isoc endpoint behavior. Maybe it was
> just random run-to-run variation? See below:
>
>> * One 120-frame run completed in 15.109 seconds, giving an effective
>>     7.94 delivered fps and 304 skipped sequence numbers.
>> * Five consecutive restart runs all completed with rc=0, but their
>>     effective delivered rates ranged from 3.71 to 21.08 fps.
>   
>> With uvcvideo trace=0x400, both values of
>> exposure_dynamic_framerate selected the same streaming configuration:
>>
>> Device requested 3072 B/frame bandwidth
>> Selecting alternate setting 7 (3072 B/frame bandwidth)
>> Allocated 5 URB buffers of 32x3072 bytes each
> 640x480 YUYV at 30fps is 2.3KB per ESIT. For a smaller altsetting,
> you need lower resolution or framerate, or compression like MJPEG.
>
> Regards,
> Michal
--------------92LoYnhMzpiVD0VDDrmTK1Nb
Content-Type: application/gzip; name="320x240-altsetting-final.tar.gz"
Content-Disposition: attachment; filename="320x240-altsetting-final.tar.gz"
Content-Transfer-Encoding: base64

H4sIAAAAAAAAA+2a2XLbNhSGfWs+BWZ60WRqSti4yeVF7Cz1TJO4XtLJlQYkQRlTilRAUFXy
VJ32RfJIBWh5iRyajpUqbY3vwqKJAxwQwA8cgCQYLjCFLitUzZUS5cTNRcmK4dbXA2oCzzO/
KPDg9d8LtpCHKcYe9FCwBZHvIbgFvK9Yh06aWjEJwNacSyUm1UDy7LN2fen/UUhX/zclm/KB
Wqj1fZgO9int7H/k08v+p57ufwyJj7cAXN91Pw+8/38WZbMAOc8qyUAwQIPQxRAOFmepIFnE
eUIGeUrpYBH6Y5+C7xA4fnkIDo+ePXt5eDJ++vbVk5cH++Ck4eBJMwEoBDAaEToiCJye7AMM
sQ+WWV+8Oh223pxv/cyWKzr1n06zQpRfZQbo0z8leFX/vu9b/W+CvdevT8YHL5+8eBY/Osvg
zmSm8OOhrCo1TMyf+VSPguaD2z81mDzx6enB0xhBjCHPQjdKUObSJMjciOWeiznOaU7yPMmM
eZsjL9ikjusmmVdFbG4AeTZJwLtGcH2ZDTIpdMsPkoKlvxWiVnFZNXPOmp2ymrNxWkkOplU2
k1XCbzUSpeLFWFTTaRNXJWgvBjNW1+pMVs3kLIbLe7WSIlUxeiCzVKf+9X9uWpVKVsWgqCbr
+OjT//X471z/iOpw0ep/A9za/3klp0yt2/39/U+81f7Hge3/jfBc6jAfSKY40D0OVAUIHOgu
AfmsfiBT4IOmO/6rylxMGj0yRFWuFwX26d9cf6p/PQFY/W8EvphVdSP5OHuvN/wiHedmQjDz
wQhA53m7AIA3IuMV2GczpS1HzvavIlNnw5+4mJwp0DICeiAN9UBytg/FghdgmXOZ+P3b07dv
vgePzA+gIzzCj53t54IXGbjOCLyqSu5s771XvAYzLoHeMPLzFN+UfSw+cHAwZRN+lQV5xIc6
bb8qKlnPWHotrT56sedsn0hW1rku7XlTpmY465Qjng5AACNn++1+si+HPx2/Ac/KtMq0Akbg
4OTUPQI+RM72Lw0rlfjQyuCi2Kc8Z02hwKMpm9VmzvxZTIXiGThi5YSbRzNR7cqjOcdKct3E
5QQcMtPIisv6RtPqK5aIQijB62VGJaZct0XbMbpo83PeODXXIs1GFzP2IwKHSDs/4iwDSZPn
pvzzImDnVN69/mtZ6AiwkXUl19wE9p7/BKv7P32HWv1vgjr2Uh+noccDL8IU+VESwoBmEOk9
XODhPN0VcYrDfDeJCfGD0M9phJKE5oyFFPsM8pQiGmWMebvT2KcJDUO2q2Lfi6Isjfw8hSHe
XcSI0TykYZayNND7QmKDi38FnfpXUs+krhaH4m7WSJOgJ2V1n6mgN/7Hq+e/JMCB1f8maObp
3CxB47a/zdENtcp8QNyy/ptoxSUQ/tP7fx3to2vv/3yz/msLq/9N8KPBRJDUM1v+HZDJajbj
lwGkDryJc2XkdxgR6vSZePC8nB53NHJ6bUjgLC1ohwWGl/XpMjmvco8njC4q3efQv6Mh6a8Z
8q7KulOZwU37Phf+apZbmwGRz3nod/OZB7lbRnoj4+2tHzl3eWjk3KGoT1zfboq+rJarrXi7
cdjddm1Gct8278p4Wb3b6xV8IuPOtsHOj3eyWzq1Qce3oXP9l7xuinuF+zfo3f97q+s/9Hxi
1/9N0B7zxOY7DReGLsYnCI6IN0JoxyME+WGIyQ+QjCB0eJndtKN4x4cwCmgA4dIuW54Zj6d1
TBD0PUemcfcBlOWb0qn/37gs+dqvflt6v/+4qX8a2O+/NsLHPz7++fEvvVyDC+FffAx2PgBG
4OKEACBXJw+gOf6ei5QDyd81vDbH3gQGGOwN2xNqkLAy+928IHDuU/YxL3hqhiHQI1JbLV9M
tncCc8T9OU+P7+XqSVFUKTP198Dp0d7lkXmVA4IXraekfRHBWXr2f52/ur//nKfmpls30ymT
79cJBL5M/+37P4Ls+d9GsPq3+u96/6dErURar70H6NM/pnRF/4hSG/9vhDY2vxmyZ7ww313y
bLxURUxMaK9372PJZ5VUdYwD5/xSG9VmKihTPp6wWR37GDqXd2ZVLUzZdRzp21wXpuU95+Mr
D7nOEg18/5rTGZcpL1VM8MB/KF9iWiwWi8VisVgsFovFYrFYLBaLxWKxWCwWy3r8DfayevkA
UAAA

--------------92LoYnhMzpiVD0VDDrmTK1Nb--
