Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792865841;
	b=lRYT5fOMgu2pDcqMf7tRF0Bt6YsOkrIaBBfKEofs6fI+YZElD1IAfqnRwzrTBtXVuFXQ
	 lG3JG8ioI2nGhAFrSA4JaufMZMS9fdJ2L6fzxfdi1sFv8Up3VH1knGwUZon6p0hLdombu
	 AG6ZZWtj/PwXO5Kn+Rn9dMNlsOiCNzhPpYj0dbNWXyZaqBTn696WuVSM5pw4nN1/pCffn
	 JxPiDPSpkxxzdpw+O49xTaJxYLceAQEjKRwIpTQmA1Tan7XlYfvnxEmlh8M0lr8v0cShy
	 4ql8CVOj5cWoX9oeZg8X4YCPk0XjPBMLhRnsgzfNZa4c3iIYj7nEgsqA/KXGhFPZqKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792865841;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:From:Content-Language:To:Cc:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MCIvJuZWv32x6eJbDQMLTu5JuesvONjdVTfyLboircE=;
	b=eT+E4NbBUP8ll8xWdDFw87/KvcoumEuVgEQKRKbAGU+A0mdGmW51y5Wb58EJYa13C4R2
	 wXd5QInZvIvT5XUYevvfkTsYN774E/wJcWjusN1zOHn0bSRKXyZpxrqi5r8U1d1ReVprz
	 W4LwjxnGDyTd+w6Mrgnp8w1Ux5j67sW5C80AyBPH0ZA46uB9llsjNjkRi9lCE2SjPC+xJ
	 nqunVED/vARNZyy2gRa86l3Hgrv31benuDlmYMUWkSHG3w6LJjr3bgb/8vetI4SnYm2/r
	 FpfDRVXRqVCYDT2noOMu4l1otOLgw1NIxM1VE4/rMK9Vbnwm3PIf5gFvorl3Pjiaf8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OBJxteo4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kJjiBuuS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF67606A31A
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 18:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF67606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OBJxteo4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kJjiBuuS
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OF0HSU2371272
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 18:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MCIvJuZWv32x6eJbDQMLTu
	5JuesvONjdVTfyLboircE=; b=OBJxteo4Ah8ntu6eF5BAjbaPAV8iRdzkdrjZZ0
	x7pjuHji0xKlsvKYxx/ArQBlS5RpqwZH4rbTmEspO4cXJ5qtm0a3TITpW4vba3Q+
	EEGid4TXGHYVr3YeIh2ukuvNnoxyU/gDtow3pwFGTxjRfRIP2Qj1Tp72N311fPv1
	HsdgislPoxyZn7thjGiwKYcvfwInQR4bowpESfd2LPqjfPN0cbo7sLOlFo07x16X
	72Vj1CbppDbtE1JMxHbv831hQ4jEA4PibFoUAARWVQi0+9I8/Kt1kbtRNIjsoEiR
	RzRKOBq9e76S6Ga6VXO90tOKca4Bbq/3VWXIgEDWjiVUK7bw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6hngh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 18:17:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf6c528aso303192185a.0
        for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 11:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792865839; x=1793470639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:cc:to
         :content-language:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MCIvJuZWv32x6eJbDQMLTu5JuesvONjdVTfyLboircE=;
        b=kJjiBuuS5SGlI10afg/CYEF6vaoFa9y+ObhRWHqgi4VHXlVuxmQCtbjj38Xa0ElcgS
         0W4WPe1B79GrzOuJbJCBdJkZLonIs9hcz2VTZH1jPVCy3gxKS3IVQ0HKMc8RgKL2IGRL
         OYPZi/5o+z9DGTps/9zzXtDNRLtbL2HGreWv8qLEISnuv8ZtaOxRoEl8VHUO69nz+z5J
         EfeaEletMUxFnym3r18cf1VCMWUrmGZrvSh3jxFwDDlbOZTLKTQA8Hzp+WAQo32Our47
         XCCtVjV3eCO4RXJ02Yvl6xQFhbh2FNdjwb1fGTToC1yofFzIfLfMDvd1lQYcM48v/iqi
         n2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792865839; x=1793470639;
        h=content-transfer-encoding:content-type:subject:cc:to
         :content-language:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MCIvJuZWv32x6eJbDQMLTu5JuesvONjdVTfyLboircE=;
        b=RNWD6VqiuxYQ2Gq+sfJVDx9xOHDmssbbnA4FN0ljStebAVzMkwfTcjBMiTuA7SvZto
         sbuzmK6Zd98bcIExVly4WJ9ts6NWWJRXCvuRW1UVh2XAJ8+57bktKwFfiPzuVqDuhXW+
         xjTuZFARQiKEU1zkAgYz9EbXq+8SWHHgN7GUMN2avCwMiPndIWyWxG+rMICwMaHMJuIT
         Of+yIQdhnOeEFmaOQAxS6nhNEKkD4+C2v+CF1gVZuWW3Q+25FLsiN75QZPGm1+F/UMHu
         tC7RHPLxpfPVZur9cBiOM1yplTs1UQE8MGaXtH49OsSLZktL9gzT7XPJl4n2GckCcc7k
         prnQ==
X-Gm-Message-State: AFq9FYIt8Ud4buz5fsImJKBLmcLQmSnRzaAHR5Qq5PHX0qe4jCAMYVTH
	FSeBy3NtGD5pU3Jxh3HF3QX6ovXkeDPR7lJJ3y8edsZXnU+EaFe9b8rskFSNzN1wGSH5QXcD9dE
	7I3xdQT+pPW02NX58waQfHpIGnlxvy5jxsGZYcvZMhavE4EbAwYzzOjoorcQanj8=
X-Gm-Gg: AYBFou0NsXRM2b7LbXF6fUTYM/NaK0MA49+2DOZ87sukDO/0D0pLdpJ8vsyTlqpgie0
	M1PKMyMNKGTBSnXUdolyuDZ4+GodCk/pUDjG1nxmTCGwpr688aW9V5SQqCGO0CNZeiasQ9nSiUa
	AWpD4es+XPKw+Tw/xEOn+U+B3lcfQD+KcOqUvJihQ1vFdUCIN8GhUD9yQh4/qxEe7Jx2qGhuUKr
	q6byQg6wZ9pGFAMTNWE6MiJJsEogoRY3X7rRP5seaWWWAMdHfYV+riL+xgVXTWCQ4jxgGC8X/KN
	LpF0uw1+r/HGmCJ292or/BelLqMCf/IYWGF8DOdvRqorD7lbtJr1Ndg8QK9WEbP3BdeF/MPZjra
	fMlx52E6Nh1pfld3+VstHsIJu2/pQeT7al3ZqrVVQISwzOUuiEfmQYcVHQXf+1PKVMBuOo5gXbe
	Zj+OqMt3Mmhre+a+5ZupxbjGNQP8ZZ6RJmyaip0HWwAB3qkYyFOUs6Ek4kR8NIuw5tWw==
X-Received: by 2002:a05:620a:6085:b0:93f:2a56:2772 with SMTP id af79cd13be357-940ef9df0d6mr349734585a.78.1792865838810;
        Sat, 24 Oct 2026 11:17:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6085:b0:93f:2a56:2772 with SMTP id af79cd13be357-940ef9df0d6mr349732985a.78.1792865838343;
        Sat, 24 Oct 2026 11:17:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b47sm114836366b.40.2026.10.24.11.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 11:17:17 -0700 (PDT)
Message-ID: <b5145213-9542-4351-8f98-527aad74ee64@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:16 +0200
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
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
To: Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb <linux-usb@vger.kernel.org>
Subject: "thunderbolt ... (DP): not active, tearing down" error breaking DP
 over thunderbolt displays
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nf9lolxYKnPZ7AbkpEqB10dfdESUm7gr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA3MiBTYWx0ZWRfX2zj0Le3RGIcZ
 1ZO2Dcpzs+aHObJoH/f8pLu7vUL57730YOck/90CBciqgRGPFGyIoXOlJyWY46hRe4bqISEGb4d
 Kq435W5k0/fO0cP/hapKtSBXdn9xTAk=
X-Proofpoint-GUID: nf9lolxYKnPZ7AbkpEqB10dfdESUm7gr
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adcf62f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=zmGJjQdJ9mVjJaYn2lwA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA3MiBTYWx0ZWRfX7vAyQNI8w2I5
 AW8ZC9UlBzXLqkxw8NLiFuR5H/aQCP2HWHJIjVMWo14gZOTljSWnHfDbBh8gYhoAuiRu6bv5QR8
 taQdorpAah4gxxh4xdKAQA00COFxoKENaIs+UaQAvllFpuy1ovWjjq3cg80+WcngyfyhP4gI81H
 LQGQhvezGs8ELVTQd97p9MNXvDOP19NG77qnXOIpj3O7AKFf7N18wkDHlpb5tp9ycmEMg/FsFN/
 y49JA7XyTUe89Anw63qg1vs3Rh47lnhX4uvV2TFZVO4LbvJFPor4a3eTw0Bct+F9PZyFZ23Daij
 2mCR80yhjWSU6qxbMVBP5IC5Xystgv2XXUoqEDpV6B6XZ1hxNV0W1mPyFetb0YJnLwtaNNrkToN
 axX8YuQJRbIqFdx8JMfuNmGO1OQemZDCcWBeYwITUCvZjoZFyyJ8AHkCakNQCAqTDXsP2k1PNFz
 CJ1b5rqWmGdSK5UWWNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240072

Hi All,

I hit this error:

Oct 24 19:16:58 x1 kernel: thunderbolt 0000:00:0d.3: 0:5 <-> 1:11 (DP): not active, tearing down

while doing some work on a Raptor Lake ThinkPad laptop plugged into a Thunderbolt dock.

After a bunch of debugging I found that the problem is that I had:

"UseSimpleDrm=1" in /etc/plymouth/plymouthd.conf, which combined with
the latest dracut version causes dracut to omit the i915 drm driver
from the initramfs.

And when thunderbolt.ko loads (or maybe only once userspace pokes it ?)
and the i915.ko driver has not claimed the DP connection then the above
message is logged and Linux does not see the DP attached display(s).

Building i915.ko into the initramfs works around this, but there
seems to be an assumption on the kernel side about things happening
in a certain order during boot which there should not be.

Interestingly enough when booting with the dock connected at boot,
the "thunderbolt ... (DP): not active, tearing down" repeats after
unplug + replug of the dock. Even though on the replug i915 is loaded
and active.

And when booting without the dock connected at boot and then
later connecting the dock things work fine even if i915 was not
in the initramfs.

But if i915 was not in the initramfs *and* the dock was plugged at
boot then the "thunderbolt ... (DP): not active, tearing down" error
persists on TB dock unplug + re-plugs.

I'm not familiar enough with the thunderbolt code to take a shot
at fixing this (and don't have time to dig into it), but I'm happy
to test any possible fixes for this.

Regards,

Hans


