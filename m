Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686448;
	b=DvXS8CyWxzWy995nS3y3oX09RCcYr4EF1xevHcNolsunEa0ow3Rs8wXBQYKm/Gyju77J
	 f8XcAF9t+fRdrwVCbYTB21Lev9LrEu9gCcBKFZY+7wEleR24p9axOKvzZajGbVGchpThk
	 UQlZPZIWrLOAS/++aFU1u9+xqz7urfqk9lsIXR9IL380ajjOpA3njqzU5/Kx6UA2FEK9W
	 KwfxF9iB1qIHI/YEbbJmzbDwoPNUIzQ1sD9P4TMHlGfqbWhfIywCSuFAz+BAJbKNnXrvi
	 8LGXQda3Yuy6F/fwCxPIz4gkdsUDNpn0wtJ0ZeyrntbkaNM2U72M1k15owZsHhx1z/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686448;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cmLsmwoycaOlY7rck5ZTRAIGMqEJQy3dpojcPtnT2js=;
	b=0Y932nXnNnKnxS8GBIdsQbHjfSJrTa6KLJhXQ2WoSDyDDSEqojnWzUtSNqdioRqXzhun
	 d8LXVohrb2Vsy0yAhUE156SWionUjv/gUcweRefLox4mVLEsoYuGxzoaRi9QkTU+1dO56
	 jQQ5nxXYCXUTRupL3dJtCCyX0v6wzzViBGRZSW/kqxtoXR0qmWsd9cnGQ6+XrJiTmhnd6
	 s31dNPclTVE8OYntO/yaVtGqHDazQ4pBBpSXhkevYvtkXvGO5rC3KsL6fBcsb4+07bZ9d
	 Do+XQthQweJCVzBRF8BFOp8ZYR5sr6cVu/ed97yaEXBAgA8kSkkA7eDWNzDAVLQ7ftQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZRF8ht2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UCNNnsIS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E16606A329
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 06:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86E16606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZRF8ht2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UCNNnsIS
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A32oYsG2608899
	for <linux-usb@vger.kernel.org>; Tue, 3 Nov 2026 06:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cmLsmwoycaOlY7rck5ZTRAIGMqEJQy3dpoj
	cPtnT2js=; b=pZRF8ht2hgSHW291i5O3z73nRN7NmpXzRFglnWgQwJA0xOuUvDB
	wE+/qKLEqk2qHTu8eyuQ1faSo7WmzJF1kuxAJtOG7IOKh32vjoZNAiy9XTVuTR2a
	+ReHxL28FPjgy/IRmtwfNFCjGstOGIlYrVP6CGGKDeNX69ag31Hx41lT/bepbEO1
	mdIPWzjL/r+OLmIsk2ImOaeMsnWoadthnSlawO/XGTUoC5m/7BTiiS1KnGIcZMos
	iIhQE3CBJdwajev36Te05vyt7C9c+adUZ+J3f4CwdOX8VJd4tvFRxUgqeZrnKJu1
	21UynGItlPHL79qWwWmH7A5JXPIvBMRk3Aw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76d8nb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 06:14:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so15288198eec.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 22:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793686446; x=1794291246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cmLsmwoycaOlY7rck5ZTRAIGMqEJQy3dpojcPtnT2js=;
        b=UCNNnsISsBvsE5eajT9paFCqWbsyihc/WHTKSmWTl8/rk5YKP9Xb9pwNlveZplNLkI
         t47MNxbgBEPneGUbVh0W4tFWXbhmagBzFqXNtrk+qZlPeJd3IJ2UCY4XZ0Mqedbawmr6
         QJyExejJ4pLonaFn7rH1L02jTcMExw3CgsSiuCeueoViBKXvE+qkUBZvm/8AwoRywzfA
         hCSxqh9nkPs3vwcgE7Xz9ONCkrzwTxeIhMQvl5yiXt5YArdJUxCr4tTnGv79eEOGaY+6
         ztJr4RDByMLw42oLY6inaeBZqf0iZSZ75gKfivGZtt48VRZNZcs/eFztMlbQXPPeUZHy
         ofXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686446; x=1794291246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmLsmwoycaOlY7rck5ZTRAIGMqEJQy3dpojcPtnT2js=;
        b=YI5AdyURwJWf2qNOoWQpmEBgRpXXa7uvHZv0Zt8GoA/Sw/eoXrvnfyWOA6GyoCmq1K
         GchtvOsjYxutZtfhgbjtBPe6nwK3rum9cxk8w9WqyDLIusJbLGnDZe3UohjjIH//HGXy
         OJyhK7v84od8PHHryUSMahdSdQ1AovanNmPwGk+yScRDIYOpmKnaIWduDICYiCzVRMjA
         Vnt7IRJsRRfP3LF+7R41cjmUpu5637JGagIxQ6kZEJ+RQTx1MgM/Qw0fy2slQOjdytEW
         uHVRgmvicbhRhTghJk5NxSWCNTOV8P6EoeqAymf9kpGqxQIsPFyqqI2hsKw1xts2iwAo
         dX4w==
X-Forwarded-Encrypted: i=1; AKwUvBzJytg1IEbw+sWH/RFX7NWHgysR5v2uyLK54ZqoCSXx8izavNxYhyWQH7bp9pJLBHNfLdgeBHlDUQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uVJM3k7qNC2D69wLXwAbpeT5CnhV9C9FYhastr1IVBc9Gp3/J
	xGTG/q5l/WUxPlYocZXbUa1RPi0GplRDhTqwpxsZDsBIPajmQx6ATIp1VRkov3bS/Lv39Xu4q6b
	P4nkwaSO2dE5gLVyA7Qg9QzmNpqzHLYEKLFskisrwiuMBelrIENbHaOCi8zmiDzo=
X-Gm-Gg: AYBFou05arYPhQqXvQJMCpyMxQAEsvUu5Ibqdqk43pb7OBhZhY2aRy76u/+LV63Vzj+
	vkSue8Fv983z/O9pfVSV0j+uZ5xOS3dzq9N9F2LzSx6b1F80BTOO+DSF98tTHbBVCKxejDn7HJ8
	foTjpHP5yOusI9rkgvq/JsrukKUvcik/HwemLKqIrdJ3TCYMOdoJOhquLazWIXKVMSii+G92p7l
	efS0iWa53v0Xydx64TFH1t9WfB3E2AxbXM4gz+cWTHdIdN+ODi2zg5OJtOcUHCG486tdvkrIn1O
	nX62reFQ6n4vrxlljoINyoiuoqsF3f9zWV/xEF0usjCyFxKPZshCzHld5fIhsznmSOLBH9DH0Tu
	8yVoe+pjN8Bs8HwjybPvKZtnleYLqFv9DqeMP/AObSSQKar58Jl8gU2UbsSlhVGU2zwNSMy2EN8
	6dyiEUaNEFv9lKN0e3hyzRuA==
X-Received: by 2002:a05:7301:152f:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-36a42397b34mr13292168eec.20.1793686445867;
        Mon, 02 Nov 2026 22:14:05 -0800 (PST)
X-Received: by 2002:a05:7301:152f:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-36a42397b34mr13292118eec.20.1793686445074;
        Mon, 02 Nov 2026 22:14:05 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36c8d3277e3sm1947091eec.29.2026.11.02.22.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:14:04 -0800 (PST)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [RFC PATCH 0/1] usb: dwc3: qcom: Keep wakeup option default off
Date: Mon,  2 Nov 2026 22:14:00 -0800
Message-ID: <20261103061401.2942139-1-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae97bae cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=Pt4Z8C64eHDFcQK2EPwA:9
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyNCBTYWx0ZWRfX2nrma4O6rUKr
 dZyrupVCh8yaU6/KQ/3pN6smFiGNC8S/K27MurNOx/CJHauwcYgjpGuhHve4XBdHcJokJTylLmg
 v9bYdyr9Smm07egm8/sEwk5ZBvn0lFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyNCBTYWx0ZWRfX/ivdJxwHjTqB
 biDLy/+8tZhCMGyi8UwtzJpRv5nrHAKRHzm3iAqpbhQlZnaUMq0C8SpdTT8svamD7pTr2SXioMZ
 hA1s5EUyMgRuoGGxK9kyiS5vFCLb5uSOw/AePf/HMJoUU6skg/LoyDpoOiQlONa4N5QIrcVRHhs
 BbqZUoG1hW7/FQH0m02aUunhggqkLrr+1oe/NAhDj7cgtYV5U8m50AdSqnRIG9kvu3WK8BTf4fx
 Hd2OdiCNtqq+eqxiXNq7v54ufGfyPkp1f9tPV/4xvlAzuJbXiTWfEqdB7SVASV5rrIoyaf5+F1w
 rd4ogTG8Ho7zz8kMSZaBzghyREg4nrsv6vtdWFfPykqrowaYA1RbA3vi3JNOEkztEkoQmflgbgR
 8Ni25WJcxUvqqF5kzuUKK4F7LPNaXNUYEBPbfpPyxE6Dd0HQJW0wG/G1Xz0cmYAlaoyxOL8IQfV
 NdmN21w28kaEQ6MP5vg==
X-Proofpoint-GUID: PG1ZAaMDrouMykibQj4nyPj6PVd0TF-g
X-Proofpoint-ORIG-GUID: PG1ZAaMDrouMykibQj4nyPj6PVd0TF-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030024

This RFC proposes changing the default USB system wakeup policy of the
Qualcomm DWC3 glue driver, and asks for feedback on whether the change
of default is acceptable.

Current policy
--------------
When the controller node has the "wakeup-source" property, dwc3-qcom
calls device_init_wakeup(dev, true). USB is then a system wakeup
source by default. Users who do NOT want the system woken up by USB
have to disable it:

  echo disabled > /sys/devices/.../<dwc3 device>/power/wakeup

Proposed policy
---------------
"wakeup-source" only describes that the controller is capable of
waking up the system (see
Documentation/devicetree/bindings/power/wakeup-source.txt), so with
this patch the driver only marks the device as wakeup capable, and
power/wakeup starts out "disabled". Users who NEED USB as a wakeup
source have to enable it:

  echo enabled > /sys/devices/.../<dwc3 device>/power/wakeup

The motivation is:

- Users do not expect USB activity (connect/disconnect or USB line status
  changes) to wake up the system unless they asked for it.

- Power consumption. With wakeup enabled, host mode system suspend
  keeps the controller and PHYs powered (dwc3_core_exit() is skipped
  and the genpd is not powered off) so that the wakeup interrupts can
  fire. Today this extra power is spent by default, even on systems
  where USB is never used as a wakeup source and the controller could
  be fully powered off during suspend.

Comparison
----------
                       Current (default on)       Proposed (default off)
                       --------------------       ----------------------
Initial power/wakeup   enabled                    disabled
User action            write "disabled" if USB    write "enabled" if USB
                       wakeup is NOT wanted       wakeup IS wanted
Unexpected wakeups     possible (connect,         none unless the user
                       disconnect, noise)         opted in
Host mode suspend      controller/PHYs powered,   dwc3_core_exit() and
                       wakeup IRQs armed, genpd   genpd powered off
                       kept on
Suspend power          higher, even if USB        lower, USB fully powered
                       wakeup is never used       off
Attached devices on    stay suspended, resume     reset-resumed or
resume                 quickly                    re-enumerated

Possible regression
-------------------
This is a user-visible change for existing platforms. Many Qualcomm
arm64 DTs set "wakeup-source" on the USB controller, with this patch:

- USB wakeup stops working until userspace (or a udev
  rule) writes "enabled" to the controller's power/wakeup.

- In host mode, because device_may_wakeup() is now false by default,
  system suspend takes the full power down path in
  dwc3_suspend_common() (dwc3_core_exit()) and dwc3_qcom_suspend()
  powers off the genpd. The controller resume may fail if power down
  path has not tested.

Comments on which policy is preferred for USB controllers, and whether
the regression above is acceptable, are welcome.

Peter Chen (1):
  usb: dwc3: qcom: Keep wakeup option default off

 drivers/usb/dwc3/dwc3-qcom.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.43.0

